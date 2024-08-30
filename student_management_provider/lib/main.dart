import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/presentation/provider/splash_screen/splash_screen_provider.dart';
import 'package:student_management_provider/presentation/provider/student/edit_student_provider.dart';
import 'package:student_management_provider/presentation/provider/student/new_student_provider.dart';
import 'package:student_management_provider/presentation/screens/splash/splash_screen.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
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
              backgroundColor: Colors.grey[300],
              surfaceTintColor: Colors.grey[300]),
          scaffoldBackgroundColor: Colors.grey[300],
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
