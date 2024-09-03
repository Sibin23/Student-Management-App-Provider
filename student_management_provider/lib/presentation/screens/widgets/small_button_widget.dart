import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget({
    super.key,
    required this.size,
    required this.icon,
    required this.title,
    required this.voidCallback,
  });
  final IconData icon;
  final String title;
  final Size size;
  final VoidCallback voidCallback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: GestureDetector(
        onTap: () => voidCallback(),
        child: Center(
          child: Container(
            width: size.width * .4,
            height: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? grey900
                    : greyBackground,
                boxShadow: Theme.of(context).brightness == Brightness.dark
                    ? boxShadowBlack
                    : boxShadowWhite,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                w10,
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
