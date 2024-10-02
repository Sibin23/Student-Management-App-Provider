import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_provider/core/colors.dart';

// *Height
const h10 = SizedBox(height: 10);
const h5 = SizedBox(height: 5);
const h20 = SizedBox(height: 20);
const h30 = SizedBox(height: 30);

//  *Width

const w5 = SizedBox(width: 5);
const w10 = SizedBox(width: 10);
const w20 = SizedBox(width: 20);

// *Container Decoration
final boxShadowBlack = [
  const BoxShadow(
    color: black,
    offset: Offset(5, 5),
    blurRadius: 15,
    spreadRadius: 1,
  ),
  BoxShadow(
    color: grey800,
    offset: const Offset(-3, -3),
    blurRadius: 15,
    spreadRadius: 1,
  )
];
final boxShadowWhite = [
  BoxShadow(
    color: greyBackground,
    offset: const Offset(5, 5),
    blurRadius: 15,
    spreadRadius: 1,
  ),
  const BoxShadow(
    color: white,
    offset: Offset(-5, -5),
    blurRadius: 15,
    spreadRadius: 1,
  )
];
final boxDecorCircle = BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.grey[900],
  boxShadow: [
    const BoxShadow(
      color: Colors.black,
      offset: Offset(5, 5),
      blurRadius: 15,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: grey800,
      offset: const Offset(-3, -3),
      blurRadius: 15,
      spreadRadius: 1,
    )
  ],
);
final boxDecorCircleWhite = BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.grey[300],
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade300,
      offset: const Offset(5, 5),
      blurRadius: 15,
      spreadRadius: 1,
    ),
    const BoxShadow(
      color: Colors.white,
      offset: Offset(-5, -5),
      blurRadius: 15,
      spreadRadius: 1,
    )
  ],
);

// * SnackBar Widget
Timer? _debouncer;
void customSnackBar(BuildContext context, String message,
    [VoidCallback? voidCallback]) {
  if (_debouncer != null) {
    _debouncer!.cancel();
  }
  _debouncer = Timer(const Duration(milliseconds: 500), () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? grey900
            : greyBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: Theme.of(context).brightness == Brightness.dark
                  ? boxShadowBlack
                  : boxShadowWhite),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.verified,
                color: green,
                size: 50,
              ),
              Text(
                message,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).brightness == Brightness.light
                        ? black
                        : white),
              ),
            ],
          ),
        ),
      ),
      
    ).closed.then((value){
      voidCallback!();
    });
   
   
  });
}
