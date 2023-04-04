import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dufuna/presentation/provider/favorite_provider.dart';
import 'package:dufuna/presentation/screen/home/get_started.dart';
import 'package:dufuna/presentation/screen/home/pages/home_page.dart';
import 'package:dufuna/presentation/screen/home/pages/lottie_animation.dart';
import 'package:dufuna/presentation/screen/home/splash_screen.dart';
import 'package:dufuna/presentation/screen/property/property_details.dart';
import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:dufuna/view_model/admin_view_model.dart';
import 'package:dufuna/view_model/fav_property_view_model.dart';
import 'package:dufuna/view_model/mini_filter_view_model.dart';
import 'package:dufuna/view_model/property_view_model.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'config/constants.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider<OliveProvider>(create: (_) => OliveProvider()),
        ChangeNotifierProvider<ImageViewModel>(
          create: (_) => ImageViewModel(),
        ),
        ChangeNotifierProvider<PropertyViewModel>(
            create: (_) => PropertyViewModel()),
        ChangeNotifierProvider<MiniFilterViewModel>(
            create: (_) => MiniFilterViewModel()),
        ChangeNotifierProvider<AdminViewModel>(create: (_) => AdminViewModel()),
        ChangeNotifierProvider<FavoritePropertiesViewModel>(
            create: (context) => FavoritePropertiesViewModel()),
      ],
      child: const MaterialApp(
        title: AppStrings.kTitle,
        // home: HomePageNew(),

        home: GetStarted(),

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
