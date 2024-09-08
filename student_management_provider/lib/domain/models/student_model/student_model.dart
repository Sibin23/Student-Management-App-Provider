import 'package:student_management_provider/domain/db/student_db.dart';

class StudentModel {
  final int? id;
  final String name;
  final int age;
  final String place;
  final String course;
  final String image;
  final int phoneNumber;
  final String address;
  final int pincode;

  StudentModel({
    this.id,
    required this.address,
    required this.name,
    required this.age,
    required this.place,
    required this.course,
    required this.image,
    required this.phoneNumber,
    required this.pincode,
  });

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnAge: age,
      DatabaseHelper.columnPlace: place,
      DatabaseHelper.columnCourse: course,
      DatabaseHelper.columnImage: image,
      DatabaseHelper.columnPhone: phoneNumber,
      DatabaseHelper.columnPincode: pincode,
      DatabaseHelper.columnAddress: address
    };
  }

  StudentModel copyWith({
    int? id,
    String? name,
    int? age,
    String? place,
    String? course,
    String? image,
    int? phoneNumber,
    String? address,
    int? pincode,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      place: place ?? this.place,
      course: course ?? this.course,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      pincode: pincode ?? this.pincode,
    );
  }
}
