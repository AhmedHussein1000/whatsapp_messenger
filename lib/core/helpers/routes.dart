import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_messenger/feature/auth/screens/login_screen.dart';
import 'package:whatsapp_messenger/feature/auth/screens/verification_screen.dart';
import 'package:whatsapp_messenger/feature/welcome/controller/languages_cubit/languages_cubit.dart';
import 'package:whatsapp_messenger/feature/welcome/welcome_screen.dart';

class Routes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String verification = '/verification';
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    Routes.welcome: (context) => BlocProvider(
          create: (context) => LanguagesCubit(),
          child: const WelcomeScreen(),
        ),
    Routes.login: (context) => const LoginScreen(),
    Routes.verification: (context) => const VerificationScreen(),
  };
}
