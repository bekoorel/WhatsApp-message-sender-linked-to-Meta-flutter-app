import 'package:bekoorelsender/emaile.dart';
import 'package:bekoorelsender/selectplat.dart';
import 'package:flutter/material.dart';

import 'master.dart';
import 'splach.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "sp",
      routes: {
        "sp": (context) => sp(),
        "mas": ((context) => MyHomePage()),
        "mal": (context) => maile(),
        "sel": (context) => sel(),
      },
    );
  }
}
