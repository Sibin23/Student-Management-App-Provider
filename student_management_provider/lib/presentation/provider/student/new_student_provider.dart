import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_provider/domain/db/student_db.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

class NewStudentProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final courseController = TextEditingController();
  final phoneNumController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final placeController = TextEditingController();
  final pincodeController = TextEditingController();
  String? profileImgPath;
  XFile? image;

  setImage(XFile? img) {
    image = img;
    profileImgPath = img?.path;
    notifyListeners();
  }

  void clearImage() {
    image = null;
    profileImgPath = null;
    notifyListeners();
  }

  Future<void> pickImage(BuildContext context) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setImage(pickedImage);
  }

  DatabaseHelper dataBaseHelper = DatabaseHelper();

  Future<void> addStudent(BuildContext context) async {
    try {
      final studentInfo = StudentModel(
        image: profileImgPath ?? '',
        name: nameController.text.trim(),
        age: int.parse(ageController.text.trim()),
        course: courseController.text.trim(),
        phoneNumber: int.parse(phoneNumController.text.trim()),
        pincode: int.parse(pincodeController.text.trim()),
        address: addressController.text.trim(),
        place: placeController.text.trim(),
      );

      await dataBaseHelper.insertStudent(studentInfo);
    } catch (e) {
      if (kDebugMode) {
        print('Error adding student: $e');
      }
    } finally {
      clearForm();
    }
  }

  void clearForm() {
    nameController.clear();
    courseController.clear();
    phoneNumController.clear();
    addressController.clear();
    ageController.clear();
    placeController.clear();
    pincodeController.clear();
    clearImage();
  }
}
