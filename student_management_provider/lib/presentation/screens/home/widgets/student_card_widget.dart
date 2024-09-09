import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

class StudentCardWidget extends StatelessWidget {
  const StudentCardWidget({
    super.key,
    required this.size,
    required this.voidCallback, required this.student,
  
  });
  final StudentModel student;
  final Size size;
  final VoidCallback voidCallback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        voidCallback();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).brightness == Brightness.dark
                ? grey900
                : greyBackground,
            boxShadow: Theme.of(context).brightness == Brightness.dark
                ? boxShadowBlack
                : boxShadowWhite,
          ),
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8)),
                  width: size.width,
                  height: size.height * .09,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          student.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          student.course,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Hero(
                  tag: 'tag-studentImage-${student.id}',
                  child: SizedBox(
                    width: size.width,
                    height: size.height * .15,
                    child: student.image.isEmpty
                        ? Image.asset('assets/student_img.png')
                        : Image(image: FileImage(File(student.image))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
