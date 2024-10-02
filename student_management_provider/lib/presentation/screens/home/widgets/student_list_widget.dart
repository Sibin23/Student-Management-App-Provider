import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/student_card_widget.dart';
import 'package:student_management_provider/presentation/screens/profile/screen_profile.dart';

class StudentListWidget extends StatelessWidget {
  const StudentListWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    context.read<StudentListProvider>().refreshStudentList();
    return Consumer<StudentListProvider>(builder: (context, studentList, _) {
      return studentList.students.isEmpty
          ? const Center(
              child: Text('No Students found'),
            )
          : GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  crossAxisCount: 2),
              itemCount: studentList.students.length,
              itemBuilder: (context, index) {
                return FadeInUp(
                  duration: const Duration(milliseconds: 1800),
                  child: StudentCardWidget(
                    student: studentList.students[index],
                    voidCallback: () {
                      NavigationService.instance.navigate(
                        ScreenProfile(
                            tag:
                                'tag-studentImage-${studentList.students[index].id}',
                            student: studentList.students[index]),
                        () {
                          studentList.refreshStudentList();
                        },
                      );
                    },
                    size: size,
                  ),
                );
              });
    });
  }
}
