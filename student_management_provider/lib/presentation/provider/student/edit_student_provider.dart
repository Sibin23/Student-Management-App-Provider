import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_provider/domain/db/student_db.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

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

  DatabaseHelper db = DatabaseHelper();


  Future<void> updateStudent(StudentModel student) async {
    try {
      await db.updateStudent(student);
      notifyListeners(); // Notify listeners about update
    } catch (e) {
      if (kDebugMode) {
        print('Error updating student: $e');
      }
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
