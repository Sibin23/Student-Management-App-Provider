import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/screens/home/screen_home.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/student_card_widget.dart';
import 'package:student_management_provider/presentation/screens/profile/screen_profile.dart';
import 'package:student_management_provider/presentation/screens/widgets/iconbutton_widget.dart';

import '../../../provider/student/student_list_provider.dart';

class StudentSearchListWidget extends StatelessWidget {
  const StudentSearchListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewModel = Provider.of<StudentListProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SizedBox(
          width: size.width,
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconbuttonWidget(
                        voidCallback: () {
                          NavigationService.instance
                              .navigateUntil(const ScreenHome());
                        },
                        icon: Icons.arrow_back_ios,
                        iconsize: 30),
                    w10,
                    Flexible(
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? greyBackground
                                    : grey900),
                        onChanged: (query) {
                          viewModel.filterStudents(query);
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search here..',
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? greyBackground
                                  : grey900,
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                    ),
                    w10,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child:
            Consumer<StudentListProvider>(builder: (context, studentList, _) {
          return studentList.filteredStudents.isEmpty
              ? const Center(child: Text('No Students Found'))
              : GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      crossAxisCount: 2),
                  itemCount: studentList.filteredStudents.length,
                  itemBuilder: (context, index) {
                    return FadeInUp(
                      duration: const Duration(milliseconds: 1800),
                      child: StudentCardWidget(
                        student: studentList.filteredStudents[index],
                        voidCallback: () {
                          NavigationService.instance.navigate(
                            ScreenProfile(
                                tag:
                                    'tag-studentImage-${studentList.filteredStudents[index].id}',
                                student: studentList.filteredStudents[index]),
                            () {
                              studentList.refreshStudentList();
                            },
                          );
                        },
                        size: size,
                      ),
                    );
                  });
        }),
      ),
    );
  }
}
