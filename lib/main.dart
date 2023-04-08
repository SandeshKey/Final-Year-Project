import 'package:olivehomes/presentation/provider/favorite_provider.dart';

import 'package:olivehomes/presentation/screen/home/logo_splash.dart';
import 'package:olivehomes/presentation/screen/provider/olive_provider.dart';
import 'package:olivehomes/view_model/admin_view_model.dart';
import 'package:olivehomes/view_model/fav_property_view_model.dart';
import 'package:olivehomes/view_model/mini_filter_view_model.dart';
import 'package:olivehomes/view_model/property_view_model.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/constants.dart';
import 'core/widget/contact_seller.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/auth/login_screen.dart';
import 'presentation/screen/home/olive_home.dart';
// import 'presentation/screen/home/pages/home_page.dart';
import 'view_model/image_view_model.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set status bar color transparent
    statusBarBrightness: Brightness.light, // Set status bar brightness
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();
  await Supabase.initialize(
    url: 'https://rqugcsiajclmckhemfzk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxdWdjc2lhamNsbWNraGVtZnprIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODA4Mzk1OTIsImV4cCI6MTk5NjQxNTU5Mn0.J_k38ZKOsFCNgeNiVxTeEIYQkjK3HekSLjcUhH3coD8',
  );

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

        // home: GetStarted(),
        home: LogoSplash(),
        // home: ContactSeller(),
        // home: AdminHome(),

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<auth.User?>();
    if (firebaseUser != null) {
      return const OliveHome();
    }
    return const LoginScreen();
  }
}
