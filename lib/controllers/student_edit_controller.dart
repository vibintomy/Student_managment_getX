import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/model/model.dart';

class StudentEditController extends GetxController {
  RxString profileimgpath = ''.obs;
  RxString name = ''.obs;
  RxString schoolName = ''.obs;
  RxInt age = 0.obs;
  RxInt phone = 0.obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final schoolNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  late String initName;
  late String initSchoolName;
  late int initAge;
  late int initPhone;
  late String initImg;

  void initializeData(Student student) {
    initName = student.name;
    initSchoolName = student.school;
    initAge = student.age;
    initPhone = student.phone;
    initImg = student.profiling;

    nameController.text = initName;
    schoolNameController.text = initSchoolName;
    ageController.text = initAge.toString();
    phoneController.text = initPhone.toString();
    profileimgpath.value = initImg;
  }

  void updateProfilePicPath(String path) {
    profileimgpath.value = path;
  }

  void updateName(String value) {
    name.value = value;
  }

  void updateSchoolName(String value) {
    schoolName.value = value;
  }

  void updateAge(int value) {
    age.value = value;
  }

  void updatePhone(int value) {
    phone.value = value;
  }

  showDialog() {
    Get.snackbar('Success', 'Student updated successfully',
        messageText: const Text(
          'Student data updated successfully',
          style: TextStyle(color: Colors.black),
        ),
        titleText: const Text(
          'Success',
          style: TextStyle(
              color: Colors.green, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
        isDismissible: true);
  }
}
