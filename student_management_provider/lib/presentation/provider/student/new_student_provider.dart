import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/domain/db/student_db.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';

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
    print(profileImgPath);
    notifyListeners();
    print("profileeeeee $profileImgPath");
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

  Future<void> validateForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await addStudent(context);
      } catch (e) {
        print("printing validation error $e");
      }
    }
  }

  DatabaseHelper dataBaseHelper = DatabaseHelper();

  Future<void> addStudent(BuildContext context) async {
    try {
      print("path while adding $profileImgPath");
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

      // Call the updated insertStudent method from DatabaseHelper
      await dataBaseHelper.insertStudent(studentInfo);

      final studentListProvider =
          Provider.of<StudentListProvider>(context, listen: false);
      studentListProvider.refreshStudentList(); // Call refresh method
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student added successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      print('Error adding student: $e');
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
    clearImage(); // Clear image data as well
  }
}
