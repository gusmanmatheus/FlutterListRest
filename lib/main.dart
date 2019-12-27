import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: StarWarsData(),
  ));
}

class StarWarsData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StawarsState();
}

class StawarsState extends State<StarWarsData> {
  final String url = "https://swapi.co/api/starships";
  List data;

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["results"];
      return "Success!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("StarWars"),
          backgroundColor: Colors.black87,
        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  // put some code here.
                  print(data[index]);
                },
                child: Container(
                  color: Color(0xe0e0e0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Card(
                          elevation: 10.0,
                          borderOnForeground: false,
                          color: Color(0xFF424242),
                          child: Row(children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(15.0),
                              child: Row(children: <Widget>[
                                Text(
                                  data[index]["name"],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Color(0xFFe0e0e0)),
                                ),
                              ]),
                            )
                          ]),
                        ),
                        Card(
                          elevation: 10.0,
                          color: Color(0xFFaed581),
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              data[index]["model"],
                              style: TextStyle(
                                  fontSize: 18.0, color: Color(0xFF000000)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}

//class TwoPage extends MaterialPageRoute<Null>{
      TwoPage(String str1, String str2): super(builder:(BuildContext ctx){}
  //     )
//}
