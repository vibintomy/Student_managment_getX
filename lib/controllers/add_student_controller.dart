import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentController extends GetxController {
  RxString profileimgpath = ''.obs;
  RxString name = ''.obs;
  RxString school = ''.obs;
  RxInt age = 0.obs;
  RxInt phone = 0.obs;

  void updateProfileImg(String path) {
    profileimgpath.value = path;
  }

  void updateName(String value) {
    name.value = value;
  }

  void updateSchool(String value) {
    school.value = value;
  }

  void updateAge(int value) {
    age.value = value;
  }

  void updatePhone(int value) {
    phone.value = value;
  }

  void clearImg() {
    profileimgpath.value = '';
  }

  @override
  void onClose() {
    clearImg();
    super.onClose();
  }

  saveStudent() {
    Get.snackbar('Sucess', 'Student added successfully',
        messageText:const Text(
          'Student added successfully',
          style: TextStyle(color: Colors.black),
          
        ),
        titleText:const Text('Success',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 17),),
        snackPosition: SnackPosition.BOTTOM,
        duration:const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        margin:const EdgeInsets.all(16),
        borderRadius: 8,
        isDismissible: true,
        );
  }
}
