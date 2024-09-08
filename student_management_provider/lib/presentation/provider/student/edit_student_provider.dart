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

 



  // Future<void> validateForm(BuildContext context) async {
  //   if (formKey.currentState!.validate()) {
  //     try {
  //       final studentInfo = StudentModel(
  //         image: profileImgPath ?? '',
  //         name: nameController.text.trim(),
  //         age: int.parse(ageController.text.trim()),
  //         course: courseController.text.trim(),
  //         phoneNumber: int.parse(phoneNumController.text.trim()),
  //         pincode: int.parse(pincodeController.text.trim()),
  //         address: addressController.text.trim(),
  //         place: placeController.text.trim(),
  //       );
  //       await updateStudent(studentInfo);
  //       notifyListeners();
  //       NavigationService.instance.goBack();
  //     } catch (e) {
  //       print("printing validation error $e");
  //     }
  //   }
  // }

  DatabaseHelper db = DatabaseHelper();
  Future<void> updateStudent(StudentModel student) async {
    try {
      await db.updateStudent(student);
      notifyListeners(); // Notify listeners about update
      print("Student updated successfully!");
    } catch (e) {
      print("Error updating student: $e");
    }
  }
}
