import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/edit_student/edit_student.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({
    super.key,
    required this.tag,
    required this.student,
  });
  final String tag;
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(" student id is ${student.id}");
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text('Student Profile'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FadeIn(
                duration: const Duration(milliseconds: 1800),
                child: Consumer<StudentListProvider>(
                    builder: (context, viewmodel, _) {
                  return GestureDetector(
                    onTap: () {
                      // context
                      //     .read<StudentListProvider>()
                      //     .deleteStudent(student.id!);
                      viewmodel.deleteStudent(student.id!, () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Student deleted successfully')),
                        );
                      NavigationService.instance.goBack();
                      });
                    },
                    child: Container(
                      decoration:
                          Theme.of(context).brightness == Brightness.dark
                              ? boxDecorCircle
                              : boxDecorCircleWhite,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete,
                          size: 30.0,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              h20,
              SizedBox(
                width: size.width,
                height: size.height * .3,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: Theme.of(context).brightness == Brightness.dark
                      ? boxDecorCircle
                      : boxDecorCircleWhite,
                  child: Hero(
                      tag: tag,
                      child: student.image.isEmpty
                          ? Image.asset('assets/student_img.png')
                          : Image(image: FileImage(File(student.image)))),
                ),
              ),
              h20,
              Text(
                'Name:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                student.name,
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h20,
              Text(
                'Course:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                student.course,
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h20,
              Text(
                'Phone No:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                student.phoneNumber.toString(),
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h20,
              Text(
                'Address:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                "${student.address}, ${student.place}, ${student.pincode}",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h30,
              SmallButtonWidget(
                  size: size,
                  icon: Icons.edit,
                  title: 'Edit',
                  voidCallback: () {
                    NavigationService.instance.navigate(EditStudent(
                      student: student,
                    ));
                  }),
              h30,
            ],
          ),
        )));
  }
}
