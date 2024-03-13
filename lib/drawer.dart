import "package:flutter/material.dart";

class Mydrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ishan Grover"),
            accountEmail: Text("imishangrover@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D"),
            ),
            ),  
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Ishan Grover"),
                subtitle: Text("Developer"),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text("imishan@gmail.com"),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
          ],
        ),
      );
  }
}