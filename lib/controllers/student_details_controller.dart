import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controllers/home_controller.dart';
import 'package:student_management_getx/database/databse.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/screens/edit/student_edit.dart';
import 'package:student_management_getx/widgets/delete_dialogue.dart';

class StudentDetailsController extends GetxController {
  late DatabaseHelper db;
  final HomeController homeController = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    db = DatabaseHelper();
  }

  void editStudent(Student student) {
    Get.to(StudentEdit(student: student))?.then((_) => Get.back());
  }

  void showCoustomDialog(Student student) {
    Get.dialog(DeleteDialogue(onCancel: () {
      Get.back();
    }, onDelete: () {
      db.deleteStudent(student.id).then((_) {
        homeController.refreshStudentList();
        Get.snackbar(
          'Deleted',
          'Student data deleted ',
          messageText: const Text(
            'Student data deleted successfully',
            style: TextStyle(color: Colors.black),
          ),
          titleText: const Text(
            'Deleted',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          duration:const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          margin:const EdgeInsets.all(16),
          borderRadius: 8,
          isDismissible: true,
        );
        Get.until((route) => Get.currentRoute == '/Home');
      });
    }));
  }
}
