import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/presentation/screens/home/widgets/student_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.black,
            surfaceTintColor: Colors.black,
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(5, 5),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade800,
                    offset: const Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.menu,
                  size: 30.0,
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black,
                            offset: Offset(5, 5),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.grey.shade800,
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_rounded,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  w20,
                  FadeInLeftBig(
                    duration: const Duration(milliseconds: 1800),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black,
                            offset: Offset(5, 5),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.grey.shade800,
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person_add,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
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
