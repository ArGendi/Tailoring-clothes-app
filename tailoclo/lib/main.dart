import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailoclo/providers/orders.dart';
import 'package:tailoclo/screens/add_order.dart';
import 'package:tailoclo/screens/orders_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Orders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TailoClo',
        theme: ThemeData(
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.black,
          ),
        ),
        initialRoute: OrdersList.id,
        routes: {
          AddOrderScreen.id : (context) => AddOrderScreen(),
          OrdersList.id: (context) => OrdersList(),
        },
      ),
    );
  }
}
