import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Detail extends StatefulWidget {
  DocumentSnapshot snapshot;

  Detail({this.snapshot});
  


  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:  new Text("Ponto Turistico"),
        backgroundColor: Colors.cyan[700],
        centerTitle: true,
      ),
      body: new Card(
        margin: EdgeInsets.all(0.0),
        elevation: 10.0,
        color: Colors.cyan[700],
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Image.network(
                "${widget.snapshot.data["image"]}",
                alignment: Alignment.topLeft,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width*0.95,
                // scale: 3.5,
              ),
              new Container(
                margin: EdgeInsets.only(top: 10.0),
                width: MediaQuery.of(context).size.width*0.75,
                height: MediaQuery.of(context).size.height*0.45,
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      widget.snapshot.data["title"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new SizedBox(height: 5.0,),
                    new Text(
                      widget.snapshot.data["content"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5
                      ),
                      maxLines: 17,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}