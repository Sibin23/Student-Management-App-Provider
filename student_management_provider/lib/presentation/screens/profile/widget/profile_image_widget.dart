import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

import '../../../../core/colors.dart';
import '../../../../core/constants.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.size,
    required this.tag,
    required this.student,
  });

  final Size size;
  final String tag;
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * .3,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? grey900
              : greyBackground,
          shape: BoxShape.circle,
          boxShadow: Theme.of(context).brightness == Brightness.dark
              ? boxShadowBlack
              : boxShadowWhite,
        ),
        child: Hero(
          tag: tag,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: student.image.isEmpty
                    ? const AssetImage('assets/student_img.png')
                    : FileImage(File(student.image)),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
