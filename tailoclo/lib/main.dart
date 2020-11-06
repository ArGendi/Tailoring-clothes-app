import 'package:flutter/material.dart';
import 'package:tailoclo/screens/add_order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TailoClo',
      theme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      initialRoute: AddOrderScreen.id,
      routes: {
        AddOrderScreen.id : (context) => AddOrderScreen(),
      },
    );
  }
}
