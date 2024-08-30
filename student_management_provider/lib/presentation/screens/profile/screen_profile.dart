import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/screens/edit_student/edit_student.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile(
      {super.key,
      required this.tag,
      required this.imageUrl,
      required this.name});
  final String tag;
  final String name;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text('Student Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              h20,
              SizedBox(
                width: size.width,
                height: size.height * .3,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: Theme.of(context).brightness == Brightness.dark
                      ? boxDecorCircle
                      : boxDecorCircleWhite,
                  child: Hero(tag: tag, child: Image.asset(imageUrl)),
                ),
              ),
              h20,
              Text(
                'Name:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                "Sibin Sebastian",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h20,
              Text(
                'class:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                "Flutter",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h20,
              Text(
                'Phone No:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                "8139073483",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h20,
              Text(
                'Address:',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              ),
              h10,
              Text(
                "Acharuparabil House, Nettoor, Nettoor P.0, 682040.",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              h30,
              SmallButtonWidget(
                  size: size,
                  icon: Icons.edit,
                  title: 'Edit',
                  voidCallback: () {
                    NavigationService.instance.navigate(const EditStudent());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
