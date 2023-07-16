// import 'package:demo12/screens/url_screen.dart';
import 'package:demo12/screens/about_vibechecker_screen.dart';
import 'package:demo12/screens/contact_us_screen.dart';
import 'package:demo12/screens/pricing_screen.dart';
import 'package:demo12/screens/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo12/screens/account_screen.dart';
import 'package:demo12/screens/home_screen.dart';
import 'package:demo12/screens/login_screen.dart';
// import 'package:demo12/screens/reset_password_screen.dart';
import 'package:demo12/screens/signup_screen.dart';
import 'package:demo12/screens/verify_email_screen.dart';
// import 'package:demo12/services/firebase_streem.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';

// Firebase Авторизация - Сценарии:
//    Войти - Почта / Пароль
//    Личный кабинет
//    Зарегистрироваться - Почта / Пароль два раза
//        Подтвердить почту - Отправить письмо снова / Отменить
//    Сбросить пароль - Почта

void main() async {
  // init hive (database for url)
  Hive.initFlutter();
  // open a box (also hive)
  await Hive.openBox('mybox');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        '/': (context) => const UrlScreen(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        // '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
        '/about_vibechecker': (context) => const AboutVibeCheckerScreen(),
        '/contact_us': (context) => const ContactUsScreen(),
        '/pricing': (context) => const PricingScreen(),
      },
      initialRoute: '/',
    );
  }
}