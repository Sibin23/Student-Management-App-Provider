import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/presentation/provider/student/new_student_provider.dart';
import 'package:student_management_provider/presentation/screens/widgets/custom_textfield_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/student_imagepicker_widget.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewStudentProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Student',
          style: GoogleFonts.roboto(fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<NewStudentProvider>(builder: (context, provider, _) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        FadeInDown(
                          child: StudentImagePickerWidget(
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
                              textController: viewModel.nameController),
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
                              textController: viewModel.courseController),
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
                                    textController: viewModel.ageController),
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
                                    textController:
                                        viewModel.phoneNumController),
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
                              textController: viewModel.addressController),
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
                                    textController: viewModel.placeController),
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
                                    textController:
                                        viewModel.pincodeController),
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
                                viewModel.validateForm(context);
                              }),
                        ),
                        h30,
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
