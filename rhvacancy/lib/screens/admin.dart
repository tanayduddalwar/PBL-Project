import 'package:flutter/material.dart';

class Adminpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arrayNames = ["Ram", "Raju", "Aman", "Sumit", "Atharva"];
    return Scaffold(
      appBar: AppBar(
        title: Text("ADMINPAGE"),
      ),
      body: ListView.separated(
        itemCount: arrayNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Center(
              child: CircleAvatar(
                child: Text(arrayNames[index],style: TextStyle(color:Colors.black),),
                backgroundImage: AssetImage("assets/images/profilephoto.jpg"),
                backgroundColor: Colors.transparent,
                radius: 20,
                minRadius: 20,
                maxRadius: 50,
              ),
            ),
            title: Text(arrayNames[index]),
            subtitle: Text("Number"),
            trailing: Icon(Icons.add),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 100,
            thickness: 1,
          );
        },
      ),
    );
  }
}
