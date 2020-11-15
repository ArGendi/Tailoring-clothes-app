import 'dart:io';

class ClientInfo {
  String id;
  String name;
  String tallSize;
  String armSize;
  String waistSize;
  String pocketSize;
  String chestRotation;
  String waistRotation;
  String sidesRotation;
  String shouldersSize;

  ClientInfo({this.name, this.tallSize, this.armSize, this.waistSize, this.pocketSize,
    this.chestRotation,this.shouldersSize, this.id, this.sidesRotation, this.waistRotation});
}