import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';

class DeleteAlertDialogueWidget extends StatelessWidget {
  const DeleteAlertDialogueWidget(
      {super.key, required this.studentId, required this.context});
  final int studentId;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? grey900
          : greyBackground,
      surfaceTintColor:
          Theme.of(context).brightness == Brightness.dark ? grey900 : white,
      iconColor: Theme.of(context).brightness == Brightness.dark
          ? greyBackground
          : red,
      icon: const Icon(
        Icons.warning_amber_rounded,
        size: 100,
      ),
      title: const Text('Are You Sure?'),
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You Won\'t be able to revert.'),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
            style: TextButton.styleFrom(
                shadowColor: Theme.of(context).brightness == Brightness.dark
                    ? greyBackground
                    : grey800,
                elevation: 5,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? grey900
                    : greyBackground,
                foregroundColor: Theme.of(context).brightness == Brightness.dark
                    ? greyBackground
                    : grey900,
                textStyle: GoogleFonts.roboto(fontSize: 20),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? grey800
                            : greyBackground),
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              NavigationService.instance.goBack();
            },
            child: const Text('Cancel')),
        TextButton(
            style: TextButton.styleFrom(
                shadowColor: Theme.of(context).brightness == Brightness.dark
                    ? greyBackground
                    : grey800,
                elevation: 5,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? grey900
                    : greyBackground,
                foregroundColor: Theme.of(context).brightness == Brightness.dark
                    ? greyBackground
                    : grey900,
                textStyle: GoogleFonts.roboto(fontSize: 20),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? grey800
                            : greyBackground),
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              context
                  .read<StudentListProvider>()
                  .deleteStudent(studentId, () {});
              NavigationService.instance.goBack();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? grey900
                          : greyBackground,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  content: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:
                            Theme.of(context).brightness == Brightness.dark
                                ? boxShadowBlack
                                : boxShadowWhite),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.verified,
                          color: green,
                          size: 50,
                        ),
                        Text(
                          'Student  deleted successfully',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? black
                                  : white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              NavigationService.instance.goBack();
            },
            child: const Text('Delete')),
      ],
    );
  }
}
