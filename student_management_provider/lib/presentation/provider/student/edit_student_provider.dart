import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/domain/db/student_db.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';

class EditStudentProvider extends ChangeNotifier {
  String? profileImgPath;
  XFile? image;

  void setImage(XFile? img) {
    image = img;
    profileImgPath = img?.path;
    notifyListeners();
  }

  void clearImage() {
    image = null;
    profileImgPath = null;
    notifyListeners();
  }

  void pickImage(BuildContext context) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setImage(pickedImage);
    }
  }

  StudentModel? studentModel;

  Future<void> validateForm(BuildContext context, StudentModel student) async {
    try {
      studentModel = student;
      print('Student id is ${student.id}');

      await updateStudent(student);
      notifyListeners();
      refreshStudentList();
      NavigationService.instance.goBack();
    } catch (e) {
      print("printing validation error $e");
    }
  }

  DatabaseHelper db = DatabaseHelper();
  late StudentListProvider studentListProvider; // Inject StudentListProvider

  Future<void> refreshStudentList() async {
    studentListProvider.refreshStudentList();
  }

  Future<void> updateStudent(StudentModel student) async {
    try {
      await db.updateStudent(student);
      notifyListeners(); // Notify listeners about update
      refreshStudentList();
      print("Student updated successfully!");
    } catch (e) {
      print("Error updating student: $e");
    }
  }

  clearAll() {
    studentModel = StudentModel(
        address: '',
        name: '',
        age: int.parse(''),
        place: '',
        course: '',
        image: '',
        phoneNumber: int.parse(''),
        pincode: int.parse(''));
  }
}
