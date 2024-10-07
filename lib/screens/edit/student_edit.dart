import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/controllers/student_edit_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/database/databse.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/screens/edit/update_button.dart';
import 'package:student_management_getx/widgets/textfield.dart';

class StudentEdit extends StatelessWidget {
  final Student student;
  StudentEdit({super.key, required this.student});
  final StudentEditController controller = Get.put(StudentEditController());
  @override
  Widget build(BuildContext context) {
    final DatabaseHelper databaseHelper = DatabaseHelper();
    controller.initializeData(student);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title:const Text(
          'Edit student',
        ),
        centerTitle: true,
        titleTextStyle: titleStyle,
        bottom:const PreferredSize(
            preferredSize: Size.fromHeight(30), child: SizedBox()),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<StudentEditController>(
              builder: (controller) {
                return Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Obx(()=> Container(
                          
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(image: controller.profileimgpath.isNotEmpty
                              ?FileImage(File(controller.profileimgpath.value))
                              :student.profiling.isNotEmpty
                              ? FileImage(File(student.profiling))
                              :const  NetworkImage( "https://banner2.cleanpng.com/20180802/gyc/kisspng-computer-icons-shape-user-person-scalable-vector-g-imag-icons-3-617-free-vector-icons-page-4-5b62ba06c36336.0063904315331968068003.jpg"),
                              fit: BoxFit.cover)
                            
                            ),
                            
                          )),
                        ),
                        kheight,
                        buildTextField(
                      hint: "Name",
                      controller:controller. nameController,
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.updateName(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter a name';
                        }
                        return null;
                      }),
                  kheight,
                  buildTextField(
                      hint: "School",
                      controller:controller. schoolNameController,
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.updateSchoolName(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a school name';
                        }
                        return null;
                      }),
                  kheight,
                  buildTextField(
                      hint: "Age",
                      controller:controller. ageController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          controller.updateAge(int.parse(value)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the age';
                        } else if (int.tryParse(value) == null ||
                            value.length > 2 ||
                            int.parse(value) == 0) {
                          return 'Please Enter a valid age';
                        }
                        return null;
                      }),
                  kheight,
                  buildTextField(
                      hint: "Phone",
                      controller:controller. phoneController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          controller.updatePhone(int.parse(value)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter the phone number';
                        }
                        if (value.length != 10) {
                          return 'Please Enter a valid  phone number';
                        }
                        return null;
                      }),
                      kheight,
                      UpdateButton(student: student, databaseHelper: databaseHelper),
                      ],
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.updateProfilePicPath(image.path);
    }
  }
}
