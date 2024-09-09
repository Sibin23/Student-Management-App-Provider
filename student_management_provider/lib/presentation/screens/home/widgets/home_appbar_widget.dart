import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/add_student/add_student.dart';
import 'package:student_management_provider/presentation/screens/widgets/iconbutton_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
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
          'Student Management',
          style: GoogleFonts.roboto(fontSize: 24),
        ),
        actions: [
          Row(
            children: [
              FadeInLeftBig(
                duration: const Duration(milliseconds: 2000),
                child: GestureDetector(
                  onTap: () {
                    studentList.toggleSearch();
                    studentList.closeSearchBar();
                  },
                  child: Container(
                    decoration: Theme.of(context).brightness == Brightness.dark
                        ? boxDecorCircle
                        : boxDecorCircleWhite,
                    child: AnimSearchBar(
                      searchIconColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? white
                              : grey900,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? grey900
                          : greyBackground,
                      helpText: 'Search here',
                      style: GoogleFonts.roboto(fontSize: 18),
                      width: 300,
                      textController: searchController,
                      textFieldIconColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? greyBackground
                              : grey900,
                      textFieldColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? grey900
                              : greyBackground,
                      onSubmitted: (query) {
                        print(query);
                        studentList.filterStudents(query);
                      },
                      animationDurationInMilli: 600,
                      autoFocus: false,
                      closeSearchOnSuffixTap: studentList.closeSearch,
                      onSuffixTap: () {
                        studentList.toggleSearch();
                        studentList.closeSearchBar();
                        searchController.clear();
                      },
                    ),
                  ),
                ),
              ),
              w20,
              FadeInLeftBig(
                duration: const Duration(milliseconds: 1800),
                child: IconbuttonWidget(
                    voidCallback: () => NavigationService.instance.navigate(
                          const AddStudent(),
                          () {},
                        ),
                    icon: Icons.person_add,
                    iconsize: 30.0),
              ),
              w10
            ],
          )
        ],
      );
    });
  }
}
