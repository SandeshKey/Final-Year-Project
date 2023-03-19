import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:dufuna/view_model/property_view_model.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'config/constants.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'injector.dart';
import 'presentation/provider/property_provider.dart';
import 'presentation/screen/auth/login_screen.dart';
import 'presentation/screen/home/olive_home.dart';
// import 'presentation/screen/home/pages/home_page.dart';
import 'view_model/image_view_model.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set status bar color transparent
    statusBarBrightness: Brightness.light, // Set status bar brightness
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(

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
        ChangeNotifierProvider<ImageViewModel>(
          create: (_) => ImageViewModel(),
        ), 

        ChangeNotifierProvider<PropertyViewModel>(create: (_) => PropertyViewModel()),
      ],
      child: const MaterialApp(
        title: AppStrings.kTitle,
        // home: HomePageNew()
        // theme: AppTheme.defaultTheme,
        home: AuthWrapper(),
        // home: ProfilePage(),
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
      return const OliveHome();
    }
    return const LoginScreen();
  }
}
