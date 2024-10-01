import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/home_appbar_widget.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/student_list_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: HomeAppBarWidget(),
        ),
        body: StudentListWidget(size: size));
  }
}
