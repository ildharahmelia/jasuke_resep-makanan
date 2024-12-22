import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/login_screen.dart';
// import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login & Register',
      home: LoginPage(), // Halaman pertama adalah LoginPage
    );
  }
}
