
import 'dart:io';

import 'package:tailoclo/models/client_info.dart';

class Order {
  String id;
  String payed;
  String totalPrice;
  String moreDetails;
  File image;
  String deadline;
  ClientInfo clientInfo;

  Order({this.clientInfo, this.image, this.deadline,
    this.payed, this.totalPrice, this.moreDetails , this.id});
}