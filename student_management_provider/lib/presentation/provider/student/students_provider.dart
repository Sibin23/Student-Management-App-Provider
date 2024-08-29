import 'package:flutter/material.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

class NewStudentProvider extends ChangeNotifier{
final _name = TextEditingController();
final _std = TextEditingController();
final _phoneNumber = TextEditingController();
final _address = TextEditingController();
StudentModel? model;
}