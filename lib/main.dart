import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:show_user/api/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    _showuser();
    super.initState();
  }

  var user = [];
 String page="1";

  Future _showuser() async {
    var res = await CallApi().getData("users?page="+page);
    var body = json.decode(res.body);
    setState(() {
      user = body["data"];
      print(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("users"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                page="1";
                _showuser();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              setState(() {
                page="2";
                _showuser();
              });
            },
          ),
        ],
      ),
      body: user.length == 0
          ? Center(child: Text("no user"))
          : ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(user[index]['avatar'])),
                  title: Text(user[index]['first_name'] +
                      " " +
                      user[index]['last_name']),
                  subtitle: Text(user[index]['email']),
                );
              }),
    );
  }
}
