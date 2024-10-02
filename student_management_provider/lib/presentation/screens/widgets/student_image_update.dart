import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/presentation/provider/student/edit_student_provider.dart';

class StudentImageUpdate extends StatelessWidget {
  const StudentImageUpdate(
      {super.key, required this.size, required this.imageUrl});
  final String imageUrl;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Consumer<EditStudentProvider>(builder: (context, viewModel, _) {
      return WillPopScope(
        onWillPop: () async {
          viewModel.clearImage();
          return true;
        },
        child: SizedBox(
          width: size.width,
          height: size.height * .3,
          child: GestureDetector(
            onTap: () async {
              XFile? img =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              viewModel.setImage(img);
            },
            child: Stack(
              children: [
                SizedBox(
                  width: size.width,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow:
                            Theme.of(context).brightness == Brightness.dark
                                ? boxShadowBlack
                                : boxShadowWhite,
                        color: greyBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Consumer<EditStudentProvider>(
                          builder: (context, provider, _) {
                        return CircleAvatar(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? grey900
                                  : greyBackground,
                          radius: 120,
                          backgroundImage: viewModel.profileImgPath != null
                              ? FileImage(File(viewModel.profileImgPath!))
                              : FileImage(File(imageUrl)),
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: -100,
                  child: Container(
                    decoration: Theme.of(context).brightness == Brightness.dark
                        ? boxDecorCircle
                        : boxDecorCircleWhite,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person_add,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
