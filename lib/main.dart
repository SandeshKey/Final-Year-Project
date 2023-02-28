import 'package:dufuna/config/constants.dart';
import 'package:dufuna/config/theme.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/core/widget/property_container.dart';
import 'package:dufuna/injector.dart';
import 'package:dufuna/presentation/provider/property_provider.dart';
import 'package:dufuna/presentation/screen/home/get_started.dart';
import 'package:dufuna/presentation/screen/home/home.dart';
import 'package:dufuna/presentation/screen/home/olive_home.dart';
import 'package:dufuna/presentation/screen/home/payment.dart';
import 'package:dufuna/presentation/screen/home/splash_screen.dart';
import 'package:dufuna/presentation/screen/property/property_details.dart';
import 'package:dufuna/provider/property_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screen/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PropertyProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<OliveProvider>(create: (_) => OliveProvider()),
      ],
      child: MaterialApp(
        title: AppStrings.kTitle,
        // theme: AppTheme.defaultTheme,
      home:  OliveHome(),
        // home: const SplashScreen(),
        // home: AuthWrapper(),
        // home: PaymentScreen(),
        // home: const PropertyBox(),
        // home: PropertyDetails(),
        // home: PropertyContainer(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomePage();
    }
    return const LoginScreen();
  }
}
