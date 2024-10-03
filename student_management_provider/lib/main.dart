import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/provider/splash_screen/splash_screen_provider.dart';
import 'package:student_management_provider/presentation/provider/student/edit_student_provider.dart';
import 'package:student_management_provider/presentation/provider/student/new_student_provider.dart';
import 'package:student_management_provider/presentation/provider/student/student_list_provider.dart';
import 'package:student_management_provider/presentation/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashScreenProvider>(
            create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) => StudentListProvider()),
        ChangeNotifierProvider(create: (_) => NewStudentProvider()),
        ChangeNotifierProvider(create: (_) => EditStudentProvider()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        title: 'Student Management',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: greyBackground,
              surfaceTintColor: greyBackground),
          scaffoldBackgroundColor: greyBackground,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
