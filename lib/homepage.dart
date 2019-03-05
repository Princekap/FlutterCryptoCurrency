import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class MyHomepage extends StatefulWidget {
 final List currencies;
MyHomepage(this.currencies);

  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
 List currencies;
 final List<MaterialColor> _color= [Colors.blue, Colors.indigo,Colors.red];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CryptoCurrencky App'),
      elevation: defaultTargetPlatform ==TargetPlatform.iOS ? 0.0:5.0,
    ),
    body:  _cryptoWidget(),
     
    );
  }




  Widget _cryptoWidget(){

    return new Container(
      child:Column(children: <Widget>[
        new Flexible(
  child: new ListView.builder(
    itemCount:widget.currencies.length,
    itemBuilder: (BuildContext context,int index){
final currency = widget.currencies[index];
final MaterialColor color= _color[index %_color.length];
    
    return _getListItemUI(currency,color);
    },
  ),
),
      ],)

    );
  }



  ListTile _getListItemUI(Map currency, MaterialColor color)
  {
return new ListTile(
  leading: new CircleAvatar(
    backgroundColor: color,
    child:  new Text(currency['name'][0]),  
  ),
  title: new Text(currency['name'],
  style:  new TextStyle(fontWeight: FontWeight.bold),
),
subtitle: _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
isThreeLine: true,
);

  }




  Widget _getSubtitleText(String priceUSD,String percentagechange){
    TextSpan priceTextWidget=TextSpan(text: "\$$priceUSD\n",
    style: new TextStyle(color: Colors.black));
    String percentagechangeText="1 hour: $percentagechange%";
    TextSpan percentageChangeTextwidget;
    if(double.parse(percentagechange)>0){
      percentageChangeTextwidget= new TextSpan (text: percentagechangeText, style:  new 
      TextStyle(color:Colors.green));
}else{
percentageChangeTextwidget=new TextSpan(text:percentagechangeText,
style:  new TextStyle(color: Colors.red));
}
return new  RichText(
text:  new TextSpan(
  children: [priceTextWidget,percentageChangeTextwidget ]
),
);
    }
  }
