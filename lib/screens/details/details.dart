import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controllers/home_controller.dart';
import 'package:student_management_getx/controllers/student_details_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/model/model.dart';

class StudentDetails extends StatelessWidget {
  final Student student;
  StudentDetails({super.key, required this.student});

  final controller = Get.put(StudentDetailsController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Students Details'),
        titleTextStyle: titleStyle,
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: maincolor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                kheight,
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
