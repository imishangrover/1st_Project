import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/utils/constants.dart';

class LoginPage extends StatefulWidget {
  static const String routName = "/login";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final _usenameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/20230630_172643.jpg",
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.7),
          colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                      child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _usenameController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Email",labelText: "Username"
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",labelText: "Password"
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        ),
                      ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate())
                          {
                            Constants.prefs.setBool("loggedIn", true);
                              Navigator.pushReplacementNamed(
                              context, Homepage.routName);
                          }
                          
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) => Homepage()));

                          

                        }, 
                        child: Text("Sign In")
                        )
                    ],
                  ),
                ),
              ),
                      )
                      ),
            ),
          ),
        ],),
    );
  }
}