import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:tailoclo/helpers/db_helper.dart';
import 'package:tailoclo/models/client_info.dart';
import 'package:tailoclo/models/order.dart';

class Orders extends ChangeNotifier{
  List<Order> _items = List<Order>();
  List<ClientInfo> _clientInfoList = List<ClientInfo>();
  DBHelper _dbHelper = DBHelper();
  
  addOrder(Order order) async{
    _items.add(order);
    notifyListeners();
    _dbHelper.insert('orders',{
      'id': order.clientInfo.id,
      'payed': order.payed,
      'totalPrice': order.totalPrice,
      'moreDetails': order.moreDetails,
      'image': order.image.path,
      'deadline': order.deadline,
    });
    bool clientExist = _clientInfoList.contains(order.clientInfo);
    if(!clientExist)
      _dbHelper.insert('clientInfo', {
        'id': order.clientInfo.id,
        'name': order.clientInfo.name,
        'tallSize': order.clientInfo.tallSize,
        'armSize': order.clientInfo.armSize,
        'waistSize': order.clientInfo.waistSize,
        'pocketSize': order.clientInfo.pocketSize,
        'chestRotation': order.clientInfo.chestRotation,
        'waistRotation': order.clientInfo.waistRotation,
        'sidesRotation': order.clientInfo.sidesRotation,
        'shouldersSize': order.clientInfo.shouldersSize,
      });
  }

  List<Order> get items{
    return [..._items];
  }

  List<ClientInfo> get clients{
    return [..._clientInfoList];
  }

  Future<void> fetchAndSetData() async {
    var ordersData = await _dbHelper.getData('orders');
    var clientsData = await _dbHelper.getData('clientInfo');
    
    _clientInfoList = clientsData.map((client) => ClientInfo(
      id: client['id'],
      name: client['name'],
      tallSize: client['tallSize'],
      armSize: client['armSize'],
      waistSize: client['waistSize'],
      pocketSize: client['pocketSize'],
      chestRotation: client['chestRotation'],
      waistRotation: client['waistRotation'],
      sidesRotation: client['sidesRotation'],
      shouldersSize: client['shouldersSize'],
    )).toList();

    _items = ordersData.map((item) => Order(
      id: item['id'],
      payed: item['payed'],
      totalPrice: item['totalPrice'],
      moreDetails: item['moreDetails'],
      image: File(item['image']),
      deadline: item['deadline'],
      clientInfo: _clientInfoList[0],
    )).toList();
    notifyListeners();
  }

}