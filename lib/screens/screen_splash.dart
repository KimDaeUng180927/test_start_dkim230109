import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_start_dkim230109/models/model_auth.dart';
import 'package:test_start_dkim230109/models/model_cart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authClient =
    Provider.of<FirebaseAuthProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("[*] 로그인 상태 : " + isLogin.toString());
    if (isLogin) {
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      print("[*] 저장된 정보로 로그인 재시도");
      await authClient.loginWithEmail(email!, password!).then((loginStatus) {
        if (loginStatus == AuthStatus.loginSuccess) {
          print("[+] 로그인 성공");
          cartProvider.fetchCartItemsOrAddCart(authClient.user);
        } else {
          print("[-] 로그인 실패");
          isLogin = false;
          prefs.setBool('isLogin', false);
        }
      });
    }
    return isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
//        Navigator.of(context).pushReplacementNamed('/index');
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      moveScreen();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
//      Scaffold(
//      appBar: null,
//      body:
      logo();
    //     body: Center(
    //       child: Text('Splash Screen'),
    //     ),
//    );
  }

  Widget logo(){
//    return Image.asset('assets/images/splash.jpg', fit: BoxFit.fill);
    return Image.asset('assets/images/splash.jpg');
  }

//-  @override
//-  void initState() {
//-    super.initState();
//-    initialization();
//-  }

//-  void initialization() async {
// This is where you can initialize the resources needed by your app while
// the splash screen is displayed.  Remove the following example because
// delaying the user experience is a bad design practice!
// ignore_for_file: avoid_print
//-    print('ready in 3...');
//-    await Future.delayed(const Duration(seconds: 1));
//-    print('ready in 2...');
//-    await Future.delayed(const Duration(seconds: 1));
//-    print('ready in 1...');
//-    await Future.delayed(const Duration(seconds: 1));
//-    print('go!');
//-    FlutterNativeSplash.remove();
//-  }

}