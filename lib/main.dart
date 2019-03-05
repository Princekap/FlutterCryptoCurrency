import 'package:flutter/material.dart';
import 'homepage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async {
   final List currencies= await getCurrency();;
  runApp(MyApp(currencies));
  print(currencies);

}
class MyApp extends StatelessWidget {
  final List _currencies;
MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrency App',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomepage(_currencies),
    );
  }
 
}
 Future<List> getCurrency() async{
String cryptoUrl="https://api.coinmarketcap.com/v1/ticker/?limit=50";
http.Response response = await http.get(cryptoUrl);
return json.decode(response.body);
  }

