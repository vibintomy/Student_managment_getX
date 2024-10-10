import 'package:get/get.dart';
import 'package:student_management_getx/database/databse.dart';
import 'package:student_management_getx/model/model.dart';

class HomeController extends GetxController {
  RxBool isSearching = false.obs;
  RxList<Student> students = <Student>[].obs;
  RxList<Student> filteredstudents = <Student>[].obs;

  late DatabaseHelper databaseHelper;
  
  @override
  void onInit() {
    super.onInit();
    databaseHelper = DatabaseHelper();
    refreshStudentList();
  }

  Future<void> refreshStudentList() async {
    final studentList = await databaseHelper.getStudents();
    students.assignAll(studentList);
    filteredstudents.assignAll(studentList);
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredstudents.assignAll(students);
    } else {
      filteredstudents.assignAll(students
          .where((student) => student.name
              .trim()
              .toLowerCase()
              .contains(query.trim().toLowerCase()))
          .toList());
    }
  }

  toggleSearch() {
    isSearching.toggle();
    filteredstudents.assignAll(students);
  }
}
