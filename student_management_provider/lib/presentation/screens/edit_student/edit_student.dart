import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/presentation/provider/student/edit_student_provider.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/home/screen_home.dart';
import 'package:student_management_provider/presentation/screens/widgets/custom_textfield_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';

import '../widgets/student_image_update.dart';

class EditStudent extends StatefulWidget {
  final StudentModel student;
  const EditStudent({super.key, required this.student});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  int? id;
  @override
  void initState() {
    assignStudentValues(widget.student);
    super.initState();
  }

  void assignStudentValues(StudentModel student) {
    id = student.id;
    nameController.text = student.name;
    courseController.text = student.course;
    phoneNumController.text = student.phoneNumber.toString();
    addressController.text = student.address;
    ageController.text = student.age.toString();
    placeController.text = student.place;
    pincodeController.text = student.pincode.toString();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewModel = Provider.of<EditStudentProvider>(context);
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Student'),
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            FadeInDown(
                              child: StudentImageUpdate(
                                imageUrl: widget.student.image,
                                size: size,
                              ),
                            ),
                            h20,
                            FadeInLeft(
                              child: CustomTextFieldWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Student Name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  size: size,
                                  hint: 'Name',
                                  keyboard: TextInputType.name,
                                  textController: nameController),
                            ),
                            h20,
                            FadeInRight(
                              child: CustomTextFieldWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Course Name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  size: size,
                                  hint: 'Course',
                                  keyboard: TextInputType.name,
                                  textController: courseController),
                            ),
                            h20,
                            Row(
                              children: [
                                Expanded(
                                  child: FadeInLeft(
                                    child: CustomTextFieldWidget(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Age';
                                          } else if (value.toString().length >
                                              3) {
                                            return "Enter a  valid age";
                                          } else {
                                            return null;
                                          }
                                        },
                                        size: size,
                                        hint: 'Age',
                                        keyboard: TextInputType.number,
                                        textController: ageController),
                                  ),
                                ),
                                w20,
                                Expanded(
                                  child: FadeInRight(
                                    child: CustomTextFieldWidget(
                                        validator: (value) {
                                          if (value.isEmpty || value == null) {
                                            return 'Please enter a Phone no.';
                                          }
                                          if (value.toString().length < 10 ||
                                              value.toString().length > 10) {
                                            return 'Please enter a valid phone.no';
                                          }
                                          return null;
                                        },
                                        size: size,
                                        hint: 'Phone No',
                                        keyboard: TextInputType.number,
                                        textController: phoneNumController),
                                  ),
                                ),
                              ],
                            ),
                            h20,
                            FadeInLeft(
                              child: CustomTextFieldWidget(
                                  validator: (value) {
                                    if (value.isEmpty || value == null) {
                                      return 'Please enter a Adress.';
                                    }
                                    return null;
                                  },
                                  maxLines: 3,
                                  size: size,
                                  hint: 'Address',
                                  keyboard: TextInputType.name,
                                  textController: addressController),
                            ),
                            h20,
                            Row(
                              children: [
                                Expanded(
                                  child: FadeInLeft(
                                    child: CustomTextFieldWidget(
                                        validator: (value) {
                                          if (value.isEmpty || value == null) {
                                            return 'Please enter a Place.';
                                          }
                                          return null;
                                        },
                                        size: size,
                                        hint: 'Place',
                                        keyboard: TextInputType.name,
                                        textController: placeController),
                                  ),
                                ),
                                w20,
                                Expanded(
                                  child: FadeInRight(
                                    child: CustomTextFieldWidget(
                                        validator: (value) {
                                          if (value.isEmpty || value == null) {
                                            return 'Please enter a Pincode.';
                                          }
                                          if (value.toString().length < 6 ||
                                              value.toString().length > 6) {
                                            return 'Please enter a Valid Pincode';
                                          }
                                          return null;
                                        },
                                        size: size,
                                        hint: 'Pincode',
                                        keyboard: TextInputType.number,
                                        textController: pincodeController),
                                  ),
                                ),
                              ],
                            ),
                            h20,
                            h30,
                            FadeInUp(
                                child: SmallButtonWidget(
                                    size: size,
                                    icon: Icons.save,
                                    title: 'Save',
                                    voidCallback: () {
                                      if (formKey.currentState!.validate()) {
                                        context
                                            .read<EditStudentProvider>()
                                            .updateStudent(StudentModel(
                                                id: widget.student.id,
                                                address: addressController.text
                                                    .trim(),
                                                name:
                                                    nameController.text.trim(),
                                                age: int.parse(
                                                    ageController.text.trim()),
                                                place:
                                                    placeController.text.trim(),
                                                course: courseController.text
                                                    .trim(),
                                                phoneNumber: int.parse(
                                                    phoneNumController.text
                                                        .trim()),
                                                image:
                                                    viewModel.profileImgPath ??
                                                        widget.student.image,
                                                pincode: int.parse(
                                                    pincodeController.text
                                                        .trim())));
                                        customSnackBar(context,
                                            "Student Updated Successfully !",
                                            () {
                                          context
                                              .read<StudentListProvider>()
                                              .fetchStudents();
                                          NavigationService.instance
                                              .navigateUntil(
                                                  const ScreenHome());
                                        });
                                      }
                                    })),
                            h30,
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ));
    });
  }
}
