import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_getx/model/model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key,required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
          width:300,
          height: 300,
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),

            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset: Offset(0, 5)
              )
            ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20,left: 115),
          child:student.profiling.isNotEmpty
          ? Container(
           height: 160,
           width: 160,
           decoration: BoxDecoration(
            borderRadius:const BorderRadius.only(
              topRight: Radius.circular(60),
              bottomLeft: Radius.circular(60),
              topLeft: Radius.circular(60)
            ),
            image: DecorationImage(image: FileImage(
              File(student.profiling)
            ),
            fit: BoxFit.cover)
           ), 
          )
          :Container(
            height: 160,
            width: 160,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
                topLeft: Radius.circular(60),
                
              ),
              color: Colors.blue,
             
            ),
            child:const Icon(Icons.person,size: 50,),
          )
        )
          ],
        )
        
      ],
    );
  }
}
