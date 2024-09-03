import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/home_appbar_widget.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/student_card_widget.dart';

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
        body: Consumer<StudentListProvider>(builder: (context, studentList, _) {
          return studentList.students.isEmpty
              ? Center(child: Text('No Students Added'))
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
                    final student = viewModel.students[index];
                    return FadeInUp(
                      duration: const Duration(milliseconds: 1800),
                      child: StudentCardWidget(
                        student: student,
                        size: size,
                      ),
                    );
                  });
        }));
  }
}
