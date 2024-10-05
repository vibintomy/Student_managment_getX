import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management_getx/controllers/login_controller.dart';
import 'package:student_management_getx/core/colors.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final LoginController loginContoller = Get.put(LoginController());
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor,
        child: GetBuilder<LoginController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text(
                  'Student Management ',
                  style: GoogleFonts.fredoka(
                      color: const Color.fromARGB(255, 115, 56, 56),
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
              Lottie.asset('assets/Animation - 1727772455559.json',
              width: 270,
              height: 270)
               
              ],
            );
          },
        ),
      ),
    );
  }
}
