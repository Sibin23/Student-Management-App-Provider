import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/presentation/provider/student/edit_student_provider.dart';

import '../../../../core/colors.dart';
import '../../../../core/constants.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.size,
    required this.tag,
    required this.imageUrl,
  });

  final Size size;
  final String tag;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditStudentProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        viewModel.clearImage();
        return true;
      },
      child: SizedBox(
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
                  image: imageUrl.isEmpty
                      ? const AssetImage('assets/student_img.png')
                      : FileImage(File(viewModel.profileImgPath != null
                          ? viewModel.profileImgPath!
                          : imageUrl)),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
