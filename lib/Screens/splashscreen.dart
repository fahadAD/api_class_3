import 'package:api_class3/Screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

nextFun() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getString("token")==null){
    Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(),));
  }else{
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
  }
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),() async {
     await nextFun();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal,);
  }
}
