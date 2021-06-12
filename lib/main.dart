import 'package:flutter/material.dart';
import 'package:invitationaplicationbirthdayparty/home.dart';
import '/profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
