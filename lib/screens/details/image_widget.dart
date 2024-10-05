import 'package:flutter/material.dart';
import 'package:student_management_getx/model/model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key,required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width:300,
          height: 300,
          decoration: BoxDecoration(
            
          ),
        )
      ],
    );
  }
}
