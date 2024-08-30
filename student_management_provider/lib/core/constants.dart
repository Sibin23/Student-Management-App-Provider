import 'package:flutter/material.dart';

const h10 = SizedBox(height: 10);
const h5 = SizedBox(height: 5);
const h20 = SizedBox(height: 20);
const h30 = SizedBox(height: 30);
const w5 = SizedBox(width: 5);
const w10 = SizedBox(width: 10);
const w20 = SizedBox(width: 20);

final boxShadowBlack = [
  const BoxShadow(
    color: Colors.black,
    offset: Offset(5, 5),
    blurRadius: 15,
    spreadRadius: 1,
  ),
  BoxShadow(
    color: Colors.grey.shade800,
    offset: const Offset(-3, -3),
    blurRadius: 15,
    spreadRadius: 1,
  )
];
final boxShadowWhite = [
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
      color: Colors.grey.shade800,
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
final boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  color: Colors.grey[850],
  boxShadow: [
    const BoxShadow(
      color: Colors.black,
      offset: Offset(5, 5),
      blurRadius: 15,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Colors.grey.shade800,
      offset: const Offset(-5, -5),
      blurRadius: 15,
      spreadRadius: 1,
    )
  ],
);
final boxDecorationWhite = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
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

//  decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               stops: [0.0, 0.3, 0.6, 0.2, 0.3, 0.3, 0.3, 1.0],
//               colors: [
//                 Color.fromARGB(255, 24, 31, 25),
//                 Color.fromARGB(255, 34, 56, 35),
//                 Color.fromARGB(255, 68, 113, 72),
//                 Color.fromARGB(255, 136, 180, 138),
//                 Color.fromARGB(255, 136, 180, 138),
//                 Color.fromARGB(255, 136, 180, 138),
//                 Color.fromARGB(255, 68, 113, 72),
//                 Color.fromARGB(255, 33, 31, 31),
//               ],
//             ),
//           ),