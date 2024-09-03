import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/add_student/add_student.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentListProvider>(builder: (context, studentList, _) {
      return AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: Theme.of(context).brightness == Brightness.dark
                ? boxDecorCircle
                : boxDecorCircleWhite,
            child: const Center(
              child: Icon(
                Icons.menu,
                size: 30.0,
              ),
            ),
          ),
        ),
        title: Text(
          studentList.isSearching == false ? 'Student Management' : '',
          style: GoogleFonts.roboto(fontSize: 24),
        ),
        actions: [
          Row(
            children: [
              FadeInLeftBig(
                duration: const Duration(milliseconds: 2000),
                child: GestureDetector(
                  onTap: () => studentList.toggleSearch(),
                  child: Container(
                    decoration: Theme.of(context).brightness == Brightness.dark
                        ? boxDecorCircle
                        : boxDecorCircleWhite,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search_rounded,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ),
              w20,
              FadeInLeftBig(
                duration: const Duration(milliseconds: 1800),
                child: GestureDetector(
                  onTap: () =>
                      NavigationService.instance.navigate(const AddStudent()),
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
              ),
              w10
            ],
          )
        ],
      );
    });
  }
}
