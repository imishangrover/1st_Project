//import "dart:html";

import "package:flutter/material.dart";
//import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/constants.dart';
import "../drawer.dart";
//import "../name_card_widget.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget 
{
  static const String routName = "/home";
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //  var myText = "Change Name";
  //   TextEditingController _nameController = TextEditingController();
  
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState()
  {
    super.initState();
    fetchData();
  }

  fetchData()async
  {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() { });
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routName);
            }, 
            icon: Icon(Icons.exit_to_app),
            ),
        ],
      ),

      body: data!=null
      ?ListView.builder(
        itemBuilder: (context,index)
        {
          return ListTile(
            title: Text(data[index]["title"]),
            subtitle: Text("ID: ${data[index]["id"]}"),
            leading: Image.network(data[index]["url"]),
          );
        },
        itemCount: data.length,
        )
      :Center(
        child: CircularProgressIndicator(),
        ),
      // body: Center(

      //   // child: Padding(
      //   //   padding: const EdgeInsets.all(16),

      //   //   // child: SingleChildScrollView(
      //   //   //   child: NameCardWidget(myText: myText, nameController: _nameController),
      //   //   // ),

      //   // ),
       
      // ),
      drawer: Mydrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        onPressed: (){
          //myText = _nameController.text;
          //setState(() {});
        },
        child: Icon(Icons.check),
      ),
    );
  }
}