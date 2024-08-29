import 'package:flutter/material.dart';
import 'package:student_management_provider/presentation/screens/profile/screen_profile.dart';

class StudentCardWidget extends StatelessWidget {
  const StudentCardWidget({
    super.key,
    required this.size,
    required this.index,
  });
  final int index;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => ScreenProfile(
                name: 'Sibin Sebastian',
                  tag: 'tag-studentImage-$index',
                  imageUrl: 'assets/student_list.png'))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.grey.shade800,
                  offset: Offset(-3, -3),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]),
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8)),
                  width: size.width,
                  height: size.height * .09,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sibin Sebastian',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Flutter',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Hero(
                  tag: 'tag-studentImage-$index',
                  child: SizedBox(
                    width: size.width,
                    height: size.height * .15,
                    child: Image.asset(
                      'assets/student_list.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
