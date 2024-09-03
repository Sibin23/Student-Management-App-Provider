import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_provider/domain/db/student_db.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

class EditStudentProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController courseController = TextEditingController();
  late TextEditingController phoneNumController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController placeController = TextEditingController();
  late TextEditingController pincodeController = TextEditingController();

  String? profileImgPath;
  XFile? image;

  void setImage(XFile? img) async {
    image = img;
    profileImgPath = img?.path;
    print("img path is not null $profileImgPath");

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

  void updateControllers(StudentModel? student) {
    if (student != null) {
      nameController.text = student.name;
      profileImgPath= student.image;
      courseController.text = student.course;
      phoneNumController.text = student.phoneNumber.toString();
      addressController.text = student.address;
      ageController.text = student.age.toString();
      placeController.text = student.place;
      pincodeController.text = student.pincode.toString();
    } else {
      // Clear controllers if student is null
      clearControllers();
    }
  }

  void clearControllers() {
    nameController.clear();
    courseController.clear();
    phoneNumController.clear();
    addressController.clear();
    ageController.clear();
    placeController.clear();
    pincodeController.clear();
  }

  Future<void> validateForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
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
        await updateStudent(studentInfo);
        notifyListeners();
      } catch (e) {
        print("printing validation error $e");
      }
    }
  }

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
