import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/home_appbar_widget.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/student_card_widget.dart';
import 'package:student_management_provider/presentation/screens/profile/screen_profile.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewModel = Provider.of<StudentListProvider>(context);
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: HomeAppBarWidget(),
        ),
        body: viewModel.isSearching == true
            ? StudentSearchListWidget(size: size)
            : StudentListWidget(size: size));
  }
}

class StudentListWidget extends StatelessWidget {
  const StudentListWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentListProvider>(builder: (context, studentList, _) {
      return GridView.builder(
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

class StudentSearchListWidget extends StatelessWidget {
  const StudentSearchListWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentListProvider>(builder: (context, studentList, _) {
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
    });
  }
}
