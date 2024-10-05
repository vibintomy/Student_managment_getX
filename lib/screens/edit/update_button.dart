import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controllers/home_controller.dart';
import 'package:student_management_getx/controllers/student_edit_controller.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/database/databse.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/screens/home/home.dart';

class UpdateButton extends StatelessWidget {
  UpdateButton(
      {super.key, required this.student, required this.databaseHelper});

  final Student student;
  final DatabaseHelper databaseHelper;
  final StudentEditController controller = Get.put(StudentEditController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.formKey.currentState!.validate()) {
          final name = controller.nameController.text;
          final school = controller.schoolNameController.text;
          final age = controller.ageController.text;
          final phone = controller.phoneController.text;
          final studentUpdate = Student(
              id: student.id,
              name: name,
              school: school,
              age: int.parse(age),
              phone: int.parse(phone),
              profiling: controller.profileimgpath.isEmpty
                  ? controller.profileimgpath.value
                  : student.profiling);
          databaseHelper.updateStudent(studentUpdate).then((id) {
            if (id > 0) {
              controller.showDialog();
              Get.offAll(() => Home());
              Get.find<HomeController>().refreshStudentList();
            } else {
              Get.showSnackbar (const  GetSnackBar  (
                titleText: Text(
                  'failed',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                messageText: Text(
                  'Failed to update student',
                  style: TextStyle(fontSize: 12),
                ),
                duration: Duration(seconds: 3),
              ));
            }
          });
        }
      },
      child:const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Save"),
          kwidth,
          Icon(Icons.save)
        ],
      ),
    );
  }
}
