import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:provider/provider.dart';
import 'package:tailoclo/models/client_info.dart';
import 'package:tailoclo/models/order.dart';
import 'package:tailoclo/providers/orders.dart';

class AddOrderScreen extends StatefulWidget {
  static String id = '/add-order';
  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _key = GlobalKey<FormState>();
  File _storedImage;
  DateTime _deadline = DateTime.now();
  String _name = '';
  String _tallSize = '';
  String _armSize = '';
  String _waistSize = '';
  String _pocketSize = '';
  String _chestRotation = '';
  String _waistRotation = '';
  String _sidesRotation = '';
  String _shouldersSize = '';
  String _totalPrice = '';
  String _payed = '';
  String _moreDetails = '';

  _trySubmit(ctx){
    final isValid = _key.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _key.currentState.save();
      if(_deadline.day == DateTime.now().day){
        _selectDate(ctx);
      }
      else{
        Provider.of<Orders>(context, listen: false).addOrder(Order(
          clientInfo: ClientInfo(
            id: DateTime.now().toString(),
            name: _name,
            tallSize: _tallSize,
            armSize: _armSize,
            waistSize: _waistSize,
            pocketSize: _pocketSize,
            chestRotation: _chestRotation,
            waistRotation: _waistRotation,
            sidesRotation: _sidesRotation,
            shouldersSize: _shouldersSize,
          ),
          moreDetails: _moreDetails,
          image: _storedImage,
          deadline: _deadline.toString(),
          payed: _payed,
          totalPrice: _totalPrice,
        ));
        Navigator.pop(context);
      }
    }
  }

  Future<void> _pickImage() async{
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if(imageFile == null) return;
    setState(() {_storedImage = imageFile;});
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    setState(() {_storedImage = savedImage;});
  }

  _selectDate(ctx) async{
    final date = await showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() {_deadline = date;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلب جديد'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          Builder(
            builder: (BuildContext ctx) {
              return IconButton(
                icon: Icon(Icons.date_range),
                onPressed: (){
                  _selectDate(ctx);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(3),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: _storedImage == null ?
                            IconButton(
                              icon: Icon(Icons.image),
                              onPressed: _pickImage,
                            ) : Image.file(
                            _storedImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextFormField(
                            textDirection: TextDirection.rtl,
                            validator: (value){
                              if(value.isEmpty)
                                return 'اكتب الاسم';
                              return null;
                            },
                            onSaved: (value){
                              _name = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'الأسم',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _tallSize = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'الطول',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _armSize = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'طول الكم',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _waistSize = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'طول الوسط',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _pocketSize = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'طول الجيب',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _chestRotation = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'دوران الصدر',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _waistRotation = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'دوران الوسط',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _sidesRotation = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'دوران الاجناب',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _shouldersSize = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'عرض الكتف',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _totalPrice = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'السعر الكلي',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (value){
                              _payed = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'المدفوع مقدم',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide()
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      textDirection: TextDirection.rtl,
                      maxLines: 3,
                      onSaved: (value){
                        _moreDetails = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'تفاصيل زيادة',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide()
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide()
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Builder(
                builder: (BuildContext ctx) {
                  return FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'تم',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Colors.black,
                    onPressed: (){
                      _trySubmit(ctx);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
