

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DisplayList extends StatefulWidget {

  @override
  _DisplayListState createState() => _DisplayListState();
}

class _DisplayListState extends State<DisplayList> {

  List _myList = [
    {"type": "c1", "name": "John Doe", "age": 40},
    {"type": "c2", "name": "Kindacode.com", "age": 3},
    {"type": "c3", "name": "Pipi", "age": 1},
    {"type": "c4", "name": "Jane Doe", "age": 99},
    {"type": "c1", "name": "John Doe", "age": 40},
    {"type": "c2", "name": "Kindacode.com", "age": 3},
    {"type": "c3", "name": "Pipi", "age": 1},
    {"type": "c4", "name": "Jane Doe", "age": 99},
  ];



  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text(
            "Display List Of Data",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Almarai",
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: _myList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                child: Container(
                  height: 80,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // textDirection: TextDirection.ltr,
                      children: [
                        Container(
                          height: 80,
                          child: Slidable(
                            actionPane: SlidableStrechActionPane(),
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.5,
                                          child: Text(
                                            _myList[index]["name"],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Almarai",
                                            ),
                                            textDirection: TextDirection.rtl,
                                          )),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        _myList[index]["type"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Almarai",
                                            color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.account_balance,
                                        size: 50,
                                        color: Colors.green,
                                        textDirection: TextDirection.ltr,
                                      )),
                                ],
                              ),

                            ),

                            //left slidable
                            actions: [
                              IconSlideAction(
                                caption:"Reorder",
                                foregroundColor: Colors.white,
                                color: Colors.deepOrangeAccent,
                                icon: Icons.reorder,

                              )
                            ],

                            //Right action
                            secondaryActions: [
                              IconSlideAction(
                                caption: 'Estimate',
                                foregroundColor: Colors.white,
                                color: Colors.lightBlue,
                                icon: Icons.star,

                              ),
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.redAccent,
                                icon: Icons.delete,

                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              );
            }));
  }



  Widget _buildTitleSection(String title) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 40, bottom: 15, left: 10, right: 20),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff0049e0).withOpacity(0.0),
                  blurRadius: 15,
                  spreadRadius: 5),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Start design icon mnue
              Text(
                '$title',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Almarai",
                    fontWeight: FontWeight.bold),
              ),

              GestureDetector(

                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }



  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(child: Icon(Icons.verified_user, color: Colors.green,size: 60,),  ),
          content: Text(message ,textAlign: TextAlign.center, style: TextStyle( fontFamily: "Almarai",),),
          actions: <Widget>[
            FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                return ;
                // Navigator.of(context).pop();
                //Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()), );
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(child: Icon(Icons.error, color: Colors.redAccent,size: 60,),  ),
          content: Text(message ,textAlign: TextAlign.center, style: TextStyle( fontFamily: "Almarai",),),
          actions: <Widget>[
            FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                return ;
                //Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()), );
              },
            ),
          ],
        );
      },
    );
  }

}
