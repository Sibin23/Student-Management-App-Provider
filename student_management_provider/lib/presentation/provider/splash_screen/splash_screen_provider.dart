import 'package:flutter/material.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/screens/home/screen_home.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool isLoading = true;

  Future<void> initialize(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        isLoading = false;
      },
    );

    if (!isLoading) {
      NavigationService.instance.navigateUntil(const ScreenHome());
    }
    
  }
}
