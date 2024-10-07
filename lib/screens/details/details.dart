import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/controllers/home_controller.dart';
import 'package:student_management_getx/controllers/student_details_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/screens/details/button_widget.dart';
import 'package:student_management_getx/screens/details/image_widget.dart';

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
              ImageWidget(student: student),
              kheight1,
              Row(
                children: [
                  Container(
                    height: 200,
                    width:320,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                        
                      ),
                      boxShadow: [
                       BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: Offset(0, 5)
                       )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name : ${student.name}',style: styleDetails(),),
                            Text('School : ${student.school}',style: styleDetails(),),
                              Text('Age : ${student.age}',style: styleDetails(),),
                                Text('phone : ${student.phone}',style: styleDetails(),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              kheight,
              ButtonWidget(controller: controller, student: student),
              ],
            ),
          ),
        ),
      ),
    );
  }
  TextStyle styleDetails()=> GoogleFonts.crimsonPro(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.grey
  );
}
