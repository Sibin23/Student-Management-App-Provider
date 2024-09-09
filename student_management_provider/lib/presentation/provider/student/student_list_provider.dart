import 'package:flutter/material.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/domain/db/student_db.dart';

class StudentListProvider extends ChangeNotifier {
  late DatabaseHelper databaseHelper;
  List<StudentModel> students = [];
  List<StudentModel> filteredStudents = [];
  StudentModel? fetchedStudent;
  bool noResult = false;
  bool isSearching = false;
  bool closeSearch = false;
  StudentListProvider() {
    databaseHelper = DatabaseHelper();
    refreshStudentList();
  }
  List<StudentModel> get student => students;

  void setStudents(List<StudentModel> newStudents) {
    students = newStudents;
    notifyListeners();
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredStudents = students;
    } else {
      filteredStudents = students
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<StudentModel?> fetchStudents() async {
    students = await databaseHelper.getStudents();
    filteredStudents = students;
    notifyListeners(); // Notify listeners of data change
  }

  StudentModel? fetchStudentById(int studentId) {
    for (StudentModel student in students) {
      if (student.id == studentId) {
        fetchedStudent = student;
      }
    }
    return null; // Return null if not found
  }

  Future<void> refreshStudentList() async {
    final studentList = await databaseHelper.getStudents();
    students = studentList;
    filteredStudents = students;
    notifyListeners();
  }

  toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      filteredStudents = students;
    }
    print(isSearching);
    notifyListeners();
  }

  closeSearchBar() {
    closeSearch = !closeSearch;
    if (!closeSearch) {
      filteredStudents = students;
    }
    print('closeSearch $closeSearch');
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
}
