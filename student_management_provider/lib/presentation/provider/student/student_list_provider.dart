import 'package:flutter/material.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/domain/db/student_db.dart';

class StudentListProvider extends ChangeNotifier {
  late DatabaseHelper databaseHelper;
  List<StudentModel> students = [];
  List<StudentModel> filteredStudents = [];
  bool noResult = false;
  bool isSearching = false;

  StudentListProvider() {
    databaseHelper = DatabaseHelper();
    refreshStudentList();
  }
  Future<void> fetchStudents() async {
    students = await databaseHelper.getStudents();
    notifyListeners(); // Notify listeners of data change
  }

  void filterStudents(String query) {
    final lowerCaseQuery = query.toLowerCase();
    if (lowerCaseQuery.isEmpty) {
      filteredStudents = List.from(students);
      noResult = false;
    } else {
      filteredStudents = students.where((student) {
        return student.name.toLowerCase().contains(lowerCaseQuery);
      }).toList();
      noResult = filteredStudents.isEmpty;
    }
    notifyListeners();
  }

  Future<void> refreshStudentList() async {
    final studentList = await databaseHelper.getStudents();
    students = studentList;
    filteredStudents = students;
    // Assuming you want to display all students after refresh
    noResult = false;
    notifyListeners(); // Notify listeners of data change
  }

  toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      filteredStudents = students;
    }
    print(isSearching);
    notifyListeners();
  }
final DatabaseHelper db = DatabaseHelper();

Future<void> deleteStudent(int studentId, void Function() onDeleted) async {
  try {
    await db.deleteStudent(studentId);
    await refreshStudentList(); // Refresh student list after deletion
    onDeleted(); // Call the callback function to show the snackbar
  } catch (e) {
    print("Error deleting student: $e");
  }
}
  // void filterStudents(String query) {
  //   if (query.isEmpty) {
  //     filteredStudents = students;
  //   } else {
  //     filteredStudents = students
  //         .where((student) =>
  //             student.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   }
  //   notifyListeners();
  // }
}
