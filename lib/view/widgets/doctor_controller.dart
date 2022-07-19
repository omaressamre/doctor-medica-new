import 'package:get/get.dart';
// import 'package:./doctorfirebasetest/doctor_model.dart';
import 'package:medica/services/firestore_db.dart';
import 'package:medica/view/widgets/doctor_model.dart';

class DoctorController extends GetxController {
  // Add a list of Doctor objects.
  final doctor = <Doctor>[].obs;

  @override
  void onInit() {
    doctor.bindStream(FirestoreDB().getAllDoctors());
    super.onInit();
  }
}
