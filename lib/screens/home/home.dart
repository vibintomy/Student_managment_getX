import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/controllers/home_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/screens/adding/add_students.dart';
import 'package:student_management_getx/screens/details/details.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colors1,
          title: const Text('Student List'),
          titleTextStyle: titleStyle,
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(55),
              child: CupertinoSearchTextField(
                onChanged: (value) {
                  controller.filterStudents(value);
                },
                backgroundColor: const Color.fromARGB(255, 221, 214, 214),
              )),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: maincolor2,
          child: Obx(() {
            if (controller.filteredstudents.isEmpty) {
              return const Center(
                child: Text(
                  'No Students Found',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: controller.filteredstudents.length,
              itemBuilder: (context, index) {
                final student = controller.filteredstudents[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: ()=> Get.to(()=> StudentDetails(student: student,)),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      
                      decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 171, 252, 171),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow:const [ BoxShadow(
                          color: Colors.black,
                          blurRadius:4,
                          offset: Offset(4, 4)
                        )]
                      ),
                      child: Center(
                        child: ListTile(
                          leading: student.profiling.isNotEmpty
                          ? Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image:DecorationImage(image: FileImage(File(student.profiling)),
                              fit: BoxFit.cover
                              ),
                             borderRadius: BorderRadius.circular(8)
                            ),
                            
                          )
                          :Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child:const Icon(Icons.person,size: 40,color: Colors.white,),
                            
                          ),
                          title: Text(student.name,
                          style: GoogleFonts.crimsonPro(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          color: Colors.black,
                          ),),  
                          subtitle: Text(student.school,
                          style: GoogleFonts.crimsonPro(
                            fontSize: 16,
                            color: Colors.black
                          ),),
                          trailing: Text("Age : ${student.age}",
                          style: GoogleFonts.crimsonPro(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          ),
                          minTileHeight: 60,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Get.to(AddStudents())!.then((value)=>controller.refreshStudentList());
          },
          child: const Icon(
            Icons.add,
            color: Colors.yellow,
          ),
        ));
  }
}
