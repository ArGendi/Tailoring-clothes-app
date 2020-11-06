import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOrderScreen extends StatefulWidget {
  static String id = '/add-order';
  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _key = GlobalKey<FormState>();
  String _name;
  String _tallSize;
  String _armSize;
  String _waistSize;
  String _pocketSize;
  String _chestRotation;
  String _waistRotation;
  String _sidesRotation;
  String _shouldersSize;
  String _totalPrice;
  String _payed;
  String _moreDetails;

  _trySubmit(){
    final isValid = _key.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _key.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلب جديد'),
        centerTitle: true,
        elevation: 0,
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
                    TextFormField(
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
              FlatButton(
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
                onPressed: _trySubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
