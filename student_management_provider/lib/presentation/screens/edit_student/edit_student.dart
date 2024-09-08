import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/presentation/provider/student/edit_student_provider.dart';
import 'package:student_management_provider/presentation/screens/widgets/custom_textfield_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';

import '../widgets/student_image_update.dart';

class EditStudent extends StatelessWidget {
  final StudentModel student;
  EditStudent({super.key, required this.student});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController courseController = TextEditingController();
  late TextEditingController phoneNumController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController placeController = TextEditingController();
  late TextEditingController pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewModel = Provider.of<EditStudentProvider>(context);
    nameController.text = student.name;
    courseController.text = student.course;
    phoneNumController.text = student.phoneNumber.toString();
    addressController.text = student.address;
    ageController.text = student.age.toString();
    placeController.text = student.place;
    pincodeController.text = student.pincode.toString();
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
                                imageUrl: student.image,
                                size: size,
                              ),
                            ),
                            h20,
                            FadeInLeft(
                              child: CustomTextFieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a name.';
                                    }
                                    return null;
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
                                    if (value!.isEmpty) {
                                      return 'Please enter a course.';
                                    }
                                    return null;
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
                                          if (value!.isEmpty) {
                                            return 'Please add age.';
                                          }
                                          return null;
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
                                          if (value!.isEmpty) {
                                            return 'Please enter a Phone no.';
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
                                    if (value!.isEmpty) {
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
                                          if (value!.isEmpty) {
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
                                          if (value!.isEmpty) {
                                            return 'Please enter a Pincode.';
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
                                  voidCallback: () {}),
                            ),
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
