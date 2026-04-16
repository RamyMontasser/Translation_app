import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation_app/core/service/get_it.dart';
import 'package:translation_app/core/service/storage_service.dart';
import 'package:translation_app/features/presentation/screens/main_page.dart';
import 'package:translation_app/features/presentation/screens/splash_screen.dart';

void main() async {
  getItSetup();
  WidgetsFlutterBinding.ensureInitialized();

  await StorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'translation',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const MainPage(), 
          },
        );
      },
    );
  }
}


