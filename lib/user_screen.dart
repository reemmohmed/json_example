import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _isLoading = true;
  String _userData = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Simulate a network request
    await Future.delayed(Duration(seconds: 2));
    final String response = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> data = json.decode(response);
    setState(() {
      _userData =
          "Name: ${data['name']}\nAge: ${data['age']}\nEmail: ${data['email']}";
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              )
            : Text(_userData, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
