import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';

import '../../provider/splash_screen/splash_screen_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    final size = MediaQuery.of(context).size;
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    splashScreenProvider.initialize(context);
    return ChangeNotifierProvider(
      create: (context) => SplashScreenProvider(),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset('assets/Splash_img.jpeg', fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 100,
              child: Visibility(
                visible: splashScreenProvider.isLoading,
                child:  SizedBox(
                  width: size.width,
                  child: Center(
                    child: Text(
                      'Loading',
                      style: GoogleFonts.roboto(
                        color: white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}
