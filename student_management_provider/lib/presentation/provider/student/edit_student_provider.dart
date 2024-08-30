import 'package:flutter/material.dart';

class EditStudentProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController studentName = TextEditingController();
  final TextEditingController studentDepartment = TextEditingController();
  final TextEditingController studentPhoneNo = TextEditingController();
  final TextEditingController studentAddress = TextEditingController();
  late final String image;

  bool get isValidForm => formKey.currentState?.validate() ?? false;

  void submitEditStudent() {
    if (isValidForm) {
      // Perform edit student logic here (e.g., call a service to update student data)
      print('Student information edited:');
      print('Name: ${studentName.text}');
      print('Department: ${studentDepartment.text}');
      print('Phone No: ${studentPhoneNo.text}');
      print('Address: ${studentAddress.text}');
      // Clear form or navigate elsewhere after successful edit
      studentName.clear();
      studentDepartment.clear();
      studentAddress.clear();
      studentPhoneNo.clear();
    }
  }

  @override
  void dispose() {
    studentName.dispose();
    studentDepartment.dispose();
    studentAddress.dispose();
    studentPhoneNo.dispose();
    super.dispose();
  }
}
