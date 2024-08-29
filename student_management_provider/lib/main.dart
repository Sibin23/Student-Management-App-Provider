import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/navigation/navigation_service.dart';
import 'package:student_management_provider/domain/repository/student_repository/student_repository.dart';
import 'package:student_management_provider/presentation/provider/splash_screen/splash_screen_provider.dart';
import 'package:student_management_provider/presentation/provider/student/students_provider.dart';
import 'package:student_management_provider/presentation/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashScreenProvider>(
            create: (_) => SplashScreenProvider()),
            ChangeNotifierProvider(create: (_)=> NewStudentProvider())
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        title: 'Student Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
