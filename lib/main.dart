import 'package:flutter/material.dart';
import 'dart:convert';

void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Local Json",
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home>{
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Local Json App"),
      ),
      body: new Container(
          child: new Center(
            child: new FutureBuilder(
              future: DefaultAssetBundle
              .of(context)
              .loadString("load_json/person.json"),
              builder: (context, snapshot){
                //Decode Json
                var mydata = json.decode(snapshot.data.toString());

                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Name : "+mydata[index]['name']),
                          new Text("Age : "+mydata[index]['age']),
                          new Text("Gender : "+mydata[index]['height']),
                          new Text("Height : "+mydata[index]['hair_color']),
                          new Text("Color : "+mydata[index]['gender']),
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,  
                );
              },
            ),
          ),
        ),
    );
  }
}