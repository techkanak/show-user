import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    showuser();
    super.initState();
  }

//   var user = [];
  String page = "1";
  String url = "https://reqres.in/api/users";
  Future showuser() async {
    final response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);
    print(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("users"),
      ),
      // body: user.length == 0
      //     ? Center(child: Text("no user"))
      //     : ListView.builder(
      //         itemCount: user.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             leading: CircleAvatar(
      //                 backgroundImage: NetworkImage(user[index]['avatar'])),
      //             title: Text(user[index]['first_name'] +
      //                 " " +
      //                 user[index]['last_name']),
      //             subtitle: Text(user[index]['email']),
      //           );
      //         }),
    );
  }
}
