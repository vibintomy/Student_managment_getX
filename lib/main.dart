import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/screens/adding/add_students.dart';
import 'package:student_management_getx/screens/home/home.dart';
import 'package:student_management_getx/widgets/spalsh_screen.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student management',
      theme: ThemeData(
        fontFamily:  GoogleFonts.crimsonPro().fontFamily,
        textTheme:const TextTheme(
          titleSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true
      ),
      home:const SpalshScreen(),
      initialRoute: '/SplashScreen',
      getPages: [
      GetPage(name: '/Home', page: ()=> Home()),
        GetPage(name: '/Addstudent', page: ()=>AddStudents()),
        GetPage(name: '/SplashScreen', page: ()=> const SpalshScreen())
      ],

    );
  }
}
