import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medica/view/widgets/constance.dart';

class MyAppointments extends StatefulWidget {
  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  FirebaseAuth auth = FirebaseAuth.instance;
  dynamic docnames = [];
  late String? patientnames = auth.currentUser?.displayName;
  dynamic days = [];
  @override
  Widget build(BuildContext context) {
    var user_appointment_codes = [];
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        )),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text('My Appointments'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('appointments')
                .where('user',
                    isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .get()
                    .then((value) {
                  user_appointment_codes = value.data()?['appointments'];
                  docnames = value.data()?['doctorname'];
                  patientnames =
                      FirebaseAuth.instance.currentUser?.displayName as String;
                  days = value.data()?['day'];
                });
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              // user_appointment_codes = FirebaseFirestore.instance.collection('appointments').doc()
              int index = 0;
              print(user_appointment_codes);
              if (user_appointment_codes == null) {
                return Center(child: Text("No Appointments Found"));
              } else {
                return ListView.builder(
                    itemCount: user_appointment_codes.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text(
                            patientnames!,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                docnames[index],
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          trailing: Text(
                            days[index],
                            style: TextStyle(
                                fontSize: 15, color: Colors.greenAccent),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
