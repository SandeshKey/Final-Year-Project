import 'dart:ui';

// import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:khalti/khalti.dart';
import 'package:olivehomes/presentation/provider/favorite_provider.dart';

import 'package:olivehomes/presentation/screen/home/logo_splash.dart';
import 'package:olivehomes/presentation/screen/home/pages/ecommerce_products.dart';
import 'package:olivehomes/presentation/screen/home/pages/face_id_auth.dart';
import 'package:olivehomes/presentation/screen/home/pages/location_page.dart';
import 'package:olivehomes/presentation/screen/khalti_payment.dart';
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
import 'package:alan_voice/alan_voice.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/auth/login_screen.dart';
import 'presentation/screen/home/olive_home.dart';
import 'view_model/image_view_model.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized(); //Integration of Khalti Payment
  await Khalti.init(
      publicKey: 'test_public_key_72e494a895e247f4946b46498b765cd6',
      enabledDebugging: false);
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
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // }); //preventing screenshot for Android
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
      child: MaterialApp(
        title: AppStrings.kTitle,
        // home: HomePageNew(),

        // home: GetStarted(),

        home: LogoSplash(),

        // home: HoueseView(),
        // home: ContactSeller(),
        // home: AdminHome(),
        // home: KhaltiPayment(),
        // home: EcommerceProducts(),
        // home: FaceIDAuth(),
        // home: LocationPage(),

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


