import 'package:flutter/material.dart';

import 'Screens/Home_Screen/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: null,
      routes: {
        '/': (context) => home(),
      },
    ),
  );
}
