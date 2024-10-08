import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/edit_student/edit_student.dart';
import 'package:student_management_provider/presentation/screens/profile/widget/delete_alert_dialogue_widget.dart';
import 'package:student_management_provider/presentation/screens/profile/widget/profile_image_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';

import '../../provider/student/edit_student_provider.dart';

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

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).brightness == Brightness.dark
              ? grey900
              : greyBackground,
          toolbarHeight: 60,
          centerTitle: true,
          title: FadeInDown(child: const Text('Student Profile')),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FadeInRight(
                duration: const Duration(milliseconds: 1400),
                child: Consumer<StudentListProvider>(
                    builder: (context, provider, _) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteAlertDialogueWidget(
                            context: context, studentId: student.id!),
                      );
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
              ProfileImageWidget(size: size, tag: tag, imageUrl: student.image),
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
              Consumer<EditStudentProvider>(builder: (context, provider, _) {
                return SmallButtonWidget(
                    size: size,
                    icon: Icons.edit,
                    title: 'Edit',
                    voidCallback: () {
                      NavigationService.instance.navigate(EditStudent(
                        student: student,
                      ));
                    });
              }),
              h30,
            ],
          ),
        )));
  }
}
