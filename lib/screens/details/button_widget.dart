import 'package:flutter/material.dart';
import 'package:student_management_getx/controllers/student_details_controller.dart';
import 'package:student_management_getx/model/model.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.controller, required this.student});
  final StudentDetailsController controller;
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 300,
          height: 60,
          decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(10, 0),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  controller.editStudent(student);
                },
                label:const Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                icon:const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  controller.showCoustomDialog(student);  
                },
                label:const Text(
                  'Delete',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                icon:const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
