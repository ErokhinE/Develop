// import 'package:vibe_checker/screens/url_screen.dart';
import 'package:vibe_checker/screens/about_us_screen.dart';
import 'package:vibe_checker/screens/contact_us_screen.dart';
import 'package:vibe_checker/screens/pricing_screen.dart';
import 'package:vibe_checker/screens/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vibe_checker/screens/account_screen.dart';
import 'package:vibe_checker/screens/home_screen.dart';
import 'package:vibe_checker/screens/login_screen.dart';

// import 'package:vibe_checker/screens/reset_password_screen.dart';
import 'package:vibe_checker/screens/signup_screen.dart';
import 'package:vibe_checker/screens/verify_email_screen.dart';

// import 'package:vibe_checker/services/firebase_streem.dart';
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
        '/about_us': (context) => const AboutUsScreen(),
        '/contact_us': (context) => const ContactUsScreen(),
        '/pricing': (context) => const PricingScreen(),
      },
      initialRoute: '/',
    );
  }
}
