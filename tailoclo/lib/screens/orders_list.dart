import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailoclo/providers/orders.dart';
import 'package:tailoclo/screens/add_order.dart';

class OrdersList extends StatelessWidget {
  static String id = '/orders-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبات'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.pushNamed(context, AddOrderScreen.id);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            );
          }
          return Consumer<Orders>(
            child: Center(
              child: Text(
                'لا يوجد طلبات الأن',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            builder: (BuildContext context, Orders orders, Widget child) {
              print(orders.items.length.toString());
              if(orders.items.length == 0)
                return child;
              else return ListView.builder(
                itemCount: orders.items.length,
                itemBuilder: (ctx, index){
                  return Text(orders.clients[index].name);
                },
              );
            },
          );
        },
      ),
    );
  }
}
