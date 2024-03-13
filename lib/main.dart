import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'pages/home_page.dart';

Future main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("loggedIn") == true
      ?Homepage()
      :LoginPage(),
      routes: (
        {
          LoginPage.routName : (context) => LoginPage(),
          Homepage.routName : (context) => Homepage(),
        }
      ),
    //home: Homepage(),  
    );
  }
}