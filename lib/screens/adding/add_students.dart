import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/controllers/add_student_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/database/databse.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/widgets/textfield.dart';

class AddStudents extends StatelessWidget {
  AddStudents({super.key});
  final AddStudentController controller = Get.put(AddStudentController());
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final schoolNameController = TextEditingController();
  final phoneController = TextEditingController();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors1,
        title:const  Text('Add Student',style: TextStyle(fontSize: 25),),
        centerTitle: true,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(35), child: SizedBox()),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Obx(() => controller.profileimgpath.isNotEmpty
                        ? Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: FileImage(
                                    File(controller.profileimgpath.value),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          )
                        : Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color:const Color.fromARGB(255, 176, 243, 179),
                            ),
                            child: const Icon(Icons.add_a_photo),
                          )),
                  ),
                  kheight,
                  buildTextField(
                      hint: "Name",
                      controller: nameController,
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
                      controller: schoolNameController,
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.updateSchool(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a school name';
                        }
                        return null;
                      }),
                  kheight,
                  buildTextField(
                      hint: "Age",
                      controller: ageController,
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
                      controller: phoneController,
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
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final name = controller.name.value;
                        final school = controller.school.value;
                        final age = controller.age.value;
                        final phone = controller.phone.value;
                        final student = Student(
                            id: 0,
                            name: name,
                            school: school,
                            age: age,
                            phone: phone,
                            profiling: controller.profileimgpath.value);
                        controller.clearImg();
                        databaseHelper.insertStudent(student).then((id) {
                          if (id > 0) {
                            Get.back();
                            controller.saveStudent();
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:const Color.fromARGB(255, 171, 252, 171),
                      foregroundColor: const Color.fromARGB(255, 26, 23, 23)
                    ),
                    child: const Text('Save'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.updateProfileImg(image.path);
    }
  }
}
