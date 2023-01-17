import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:test_start_dkim230109/models/model_auth.dart';
import 'package:test_start_dkim230109/models/model_cart.dart';
import 'package:test_start_dkim230109/models/model_item_provider.dart';
import 'package:test_start_dkim230109/models/model_query.dart';
import 'package:test_start_dkim230109/screens/screen_detail.dart';
import 'package:test_start_dkim230109/screens/screen_index.dart';
import 'package:test_start_dkim230109/screens/screen_login.dart';
import 'package:test_start_dkim230109/screens/screen_register.dart';
import 'package:test_start_dkim230109/screens/screen_search.dart';
import 'package:test_start_dkim230109/screens/screen_splash.dart';
import 'package:test_start_dkim230109/screens/screen_homepage.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => SearchQuery()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Shopping mall',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/index': (context) => IndexScreen(),
          '/register': (context) => RegisterScreen(),
          '/search': (context) => SearchScreen(),
          '/detail': (context) => DetailScreen(),
          '/home': (context) => MyHomePage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
