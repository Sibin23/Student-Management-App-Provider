import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/home_appbar_widget.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/student_card_widget.dart';

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
        body: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                crossAxisCount: 2),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FadeInUp(
                duration: const Duration(milliseconds: 1800),
                child: StudentCardWidget(
                  size: size,
                  index: index,
                ),
              );
            }));
  }
}
