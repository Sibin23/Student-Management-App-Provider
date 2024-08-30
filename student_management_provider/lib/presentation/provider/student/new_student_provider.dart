import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/domain/repository/student_repository/student_repository.dart';

class NewStudentProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final stdController = TextEditingController();
  final phonNumController = TextEditingController();
  final addressController = TextEditingController();
  File? studentImagePath;

  bool get isValidForm => formKey.currentState?.validate() ?? false;

  DataBaseHelper dataBaseHelper = DataBaseHelper();

  Future<void> pickImage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // Proceed with image picking
      _pickImageFromGallery();
    } else {
      // Handle permission denial gracefully, e.g., show a snackbar
      print('Storage permission denied');
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) 
 {
      studentImagePath = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future<void> addStudent() async {
    final info = StudentModel(
      image: studentImagePath?.path ?? "",
      name: nameController.text,
      std: stdController.text,
      phoneNumber: phonNumController.text,
      address: addressController.text,
    );

    if (isValidForm) {
      try {
        await dataBaseHelper.addNewStudent(info);
        // Handle successful addition (e.g., show a success message, navigate to a different screen)
      } catch (e) {
        // Handle errors (e.g., show an error message)
        print('Error adding student: $e');
      }
    } else {
      // Handle validation errors (e.g., show error messages for required fields)
    }
  }
}

