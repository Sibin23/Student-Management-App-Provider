import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/presentation/provider/student/new_student_provider.dart';

class StudentImagePickerWidget extends StatelessWidget {
  const StudentImagePickerWidget({
    super.key,
    required this.size,
   
  });

  final Size size;

 
  @override
  Widget build(BuildContext context) {
    return Consumer<NewStudentProvider>(builder: (context, provider, _) {
      final image = provider.studentImagePath;
      return SizedBox(
        width: size.width,
        height: size.height * .3,
        child: GestureDetector(
          onTap: ()=> provider.pickImage(),
          child: SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  width: size.width,
                  child: Center(
                    child: Container(
                      width: size.width * .5,
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[900]
                              : Colors.grey[300],
                          shape: BoxShape.circle,
                          boxShadow:
                              Theme.of(context).brightness == Brightness.dark
                                  ? boxShadowBlack
                                  : boxShadowWhite,
                          image: DecorationImage(
                              image: image != null
                                  ? FileImage(provider.studentImagePath!)
                                  : const AssetImage('assets/student_img.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: -100,
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
