import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medica/allConstants/color_constants.dart';
import 'package:medica/doctor/doctor_home.dart';
import 'package:medica/myAppointments.dart';
import 'package:medica/screens/home_page.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medica/allConstants/all_constants.dart';
import 'package:medica/allWidgets/common_widgets.dart';
import 'package:medica/models/chat_messages.dart';
import 'package:medica/providers/auth_provider.dart';
import 'package:medica/providers/chat_provider.dart';
import 'package:medica/providers/profile_provider.dart';
import 'package:medica/screens/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../patient/patient_home.dart';
import '../doctor/doctor_profile_navpage.dart';
import '../view/widgets/catalog_products.dart';
import '../view/widgets/custom_text.dart';
import 'cart_screen.dart';

class ChatPage extends StatefulWidget {
  final String peerId;
  final String peerAvatar;
  final String peerNickname;
  final String userAvatar;

  const ChatPage(
      {Key? key,
      required this.peerNickname,
      required this.peerAvatar,
      required this.peerId,
      required this.userAvatar})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late String currentUserId;

  List<QueryDocumentSnapshot> listMessages = [];

  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId = '';

  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = '';

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  late ChatProvider chatProvider;
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    chatProvider = context.read<ChatProvider>();
    authProvider = context.read<AuthProvider>();

    focusNode.addListener(onFocusChanged);
    scrollController.addListener(_scrollListener);
    readLocal();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onFocusChanged() {
    if (focusNode.hasFocus) {
      setState(() {
        isShowSticker = false;
      });
    }
  }

  void readLocal() {
    if (authProvider.getFirebaseUserId()?.isNotEmpty == true) {
      currentUserId = authProvider.getFirebaseUserId()!;
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
    if (currentUserId.compareTo(widget.peerId) > 0) {
      groupChatId = '$currentUserId - ${widget.peerId}';
    } else {
      groupChatId = '${widget.peerId} - $currentUserId';
    }
    chatProvider.updateFirestoreData(FirestoreConstants.pathUserCollection,
        currentUserId, {FirestoreConstants.chattingWith: widget.peerId});
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        uploadImageFile();
      }
    }
  }

  void getSticker() {
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }

  Future<bool> onBackPressed() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      chatProvider.updateFirestoreData(FirestoreConstants.pathUserCollection,
          currentUserId, {FirestoreConstants.chattingWith: null});
    }
    return Future.value(false);
  }

  void _callPhoneNumber(String phoneNumber) async {
    var url = 'tel://$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error Occurred';
    }
  }

  void uploadImageFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatProvider.uploadImageFile(imageFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, MessageType.image);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }

  void onSendMessage(String content, int type) {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();
      chatProvider.sendChatMessage(
          content, type, groupChatId, currentUserId, widget.peerId);
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing to send', backgroundColor: Colors.grey);
    }
  }

  // checking if received message
  bool isMessageReceived(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreConstants.idFrom) ==
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  // checking if sent message
  bool isMessageSent(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreConstants.idFrom) !=
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    dynamic email = '';
    dynamic name = '';
    dynamic picture = '';
    if (user != null) {
      email = user.email;
      name = user.displayName;
      picture = user.photoURL;
    }
    return WillPopScope(
      onWillPop: () async {
        // Get.to(loginAs());
        Get.back();
        return true;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/png/register.png'),
                        fit: BoxFit.fill))),
            Container(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: size.width * 0.05,
                      // ),
                      // color: Colors.green,
                      padding: EdgeInsets.only(bottom: size.height * 0.02),
                      height: size.height * 0.15,
                      // color: Colors.green,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/Arrow.svg'))
                                ],
                              ),
                              Container(
                                // width: size.width * 0.666666,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: size.width * 0.05,
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Sizes.dimen_20),
                                      ),
                                      child: Image.network(
                                        widget.peerAvatar,
                                        width: Sizes.dimen_64,
                                        height: Sizes.dimen_64,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext ctx,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: primaryColor,
                                              value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null &&
                                                      loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                        errorBuilder:
                                            (context, object, stackTrace) {
                                          return const Icon(
                                            Icons.account_circle,
                                            size: 35,
                                            color: AppColors.greyColor,
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: size.height * .02),
                                      child: Text(
                                        '${widget.peerNickname}'.trim(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'dmsans',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        // right: size.width * 0.08,
                        // left: size.width * 0.08,
                        top: size.height * 0.04,
                      ),
                      // color: Colors.green,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75),
                          // topRight: Radius.circular(10),
                        ),
                        color: Color.fromARGB(255, 246, 246, 246),
                      ),
                      height: size.height * 0.85,
                      width: double.infinity,
                      child: Scrollbar(
                        child: Column(
                          children: [
                            buildListMessage(),
                            buildMessageInput(),
                            Container(
                              // padding: EdgeInsets.only(
                              //   top: size.height * 0.02,
                              //   right: size.width * 0.1,
                              //   left: size.width * 0.1,
                              // ),
                              margin: EdgeInsets.only(top: size.height * 0.025),
                              width: double.infinity,
                              height: size.height * 0.080,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.04),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.to(() => doctor_home());
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/homeNavBarHome.svg',
                                            color: primaryColorOutOfFocus,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.008,
                                          ),
                                          CustomText(
                                            text: 'Home',
                                            textStyle: TextStyle(
                                                color: primaryColorOutOfFocus),
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(HomePage());
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/message-circleNavBarHome.svg'),
                                          SizedBox(
                                            height: size.height * 0.008,
                                          ),
                                          CustomText(
                                            text: 'Chat',
                                            textStyle:
                                                TextStyle(color: linkColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(() => doctor_profilenav());
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/UserNavBarHome.svg',
                                              color: primaryColorOutOfFocus),
                                          SizedBox(
                                            height: size.height * 0.008,
                                          ),
                                          CustomText(
                                            text: 'Profile',
                                            textStyle: TextStyle(
                                                color: primaryColorOutOfFocus),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                            // Scrollbar(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: primaryColor,
    //     centerTitle: true,
    //     title: Text('Chatting with ${widget.peerNickname}'.trim()),
    //     actions: [],
    //   ),
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
    //       child: Column(
    //         children: [
    //           buildListMessage(),
    //           buildMessageInput(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget buildMessageInput() {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.05,
      ),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            height: size.height * 0.08,
            width: size.width * 0.73,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
            child: TextField(
              focusNode: focusNode,
              textInputAction: TextInputAction.send,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              controller: textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'write here...',
                // border: InputBorder.none,
              ),
              onSubmitted: (value) {
                onSendMessage(textEditingController.text, MessageType.text);
              },
            ),
          ),
          Container(
            // margin: const EdgeInsets.only(left: Sizes.dimen_4),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
            ),
            child: TextButton(
              onPressed: () {
                onSendMessage(textEditingController.text, MessageType.text);
              },
              child: SvgPicture.asset('assets/icons/Send.svg'),
              style: TextButton.styleFrom(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(int index, DocumentSnapshot? documentSnapshot) {
    final Size size = MediaQuery.of(context).size;

    if (documentSnapshot != null) {
      ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot);
      if (chatMessages.idFrom == currentUserId) {
        // right side (my message)
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                chatMessages.type == MessageType.text
                    ? messageBubble(
                        chatContent: chatMessages.content,
                        color: AppColors.primaryColor,
                        textColor: AppColors.white,
                        margin: EdgeInsets.only(
                            right: Sizes.dimen_10, bottom: size.height * 0.005),
                      )
                    : chatMessages.type == MessageType.image
                        ? Container(
                            margin: const EdgeInsets.only(
                                right: Sizes.dimen_10, top: Sizes.dimen_10),
                            child: chatImage(
                                imageSrc: chatMessages.content, onTap: () {}),
                          )
                        : const SizedBox.shrink(),
                isMessageSent(index)
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.dimen_20),
                        ),
                        child: Image.network(
                          widget.userAvatar,
                          width: Sizes.dimen_40,
                          height: Sizes.dimen_40,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext ctx, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                                value: loadingProgress.expectedTotalBytes !=
                                            null &&
                                        loadingProgress.expectedTotalBytes !=
                                            null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: AppColors.greyColor,
                            );
                          },
                        ),
                      )
                    : Container(
                        width: 35,
                      ),
              ],
            ),
            isMessageSent(index)
                ? Container(
                    margin: const EdgeInsets.only(
                        right: Sizes.dimen_50,
                        top: Sizes.dimen_6,
                        bottom: Sizes.dimen_8),
                    child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(chatMessages.timestamp),
                        ),
                      ),
                      style: const TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isMessageReceived(index)
                    // left side (received message)
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.dimen_20),
                        ),
                        child: Image.network(
                          widget.peerAvatar,
                          width: Sizes.dimen_40,
                          height: Sizes.dimen_40,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext ctx, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                                value: loadingProgress.expectedTotalBytes !=
                                            null &&
                                        loadingProgress.expectedTotalBytes !=
                                            null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: AppColors.greyColor,
                            );
                          },
                        ),
                      )
                    : Container(
                        width: 35,
                      ),
                chatMessages.type == MessageType.text
                    ? messageBubble(
                        color: Colors.white,
                        textColor: Colors.black,
                        chatContent: chatMessages.content,
                        margin: const EdgeInsets.only(left: Sizes.dimen_10),
                      )
                    : chatMessages.type == MessageType.image
                        ? Container(
                            margin: const EdgeInsets.only(
                                left: Sizes.dimen_10, top: Sizes.dimen_10),
                            child: chatImage(
                                imageSrc: chatMessages.content, onTap: () {}),
                          )
                        : const SizedBox.shrink(),
              ],
            ),
            isMessageReceived(index)
                ? Container(
                    margin: const EdgeInsets.only(
                        left: Sizes.dimen_50,
                        top: Sizes.dimen_6,
                        bottom: Sizes.dimen_8),
                    child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(chatMessages.timestamp),
                        ),
                      ),
                      style: const TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildListMessage() {
    return Flexible(
      child: groupChatId.isNotEmpty
          ? StreamBuilder<QuerySnapshot>(
              stream: chatProvider.getChatMessage(groupChatId, _limit),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  listMessages = snapshot.data!.docs;
                  if (listMessages.isNotEmpty) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data?.docs.length,
                        reverse: true,
                        controller: scrollController,
                        itemBuilder: (context, index) =>
                            buildItem(index, snapshot.data?.docs[index]));
                  } else {
                    return const Center(
                      child: Text('No messages...'),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
              })
          : const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
    );
  }
}
