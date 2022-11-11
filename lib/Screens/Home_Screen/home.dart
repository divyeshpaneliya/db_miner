import 'package:flutter/material.dart';

import '../../data_base.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Map<String, dynamic>> l1=[];
  List<Map<String, dynamic>> l2=[];
  @override
  void initState() {
    super.initState();
    read();
  }
  void read()async{
    List<Map<String, dynamic>> res= await EXDB().readData();
    l1=res;

  }
  void read_1(int id)async{
    List<Map<String, dynamic>> res= await EXDB().readData1(id);
    l2=res;
  }


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Quotes"),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  read_1(int.parse("${l1[index]['catid']}"),);
                  data_1();
                },
                child: Card(
                  child: ListTile(
                    leading: Text("${l1[index]['catid']}"),
                    title:  Text("${l1[index]['catname']}"),
                  ),
                ),
              );
            },
            itemCount: l1.length,
          ),
        ),
      ),
    );
  }
  void data_1() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: l2.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                         leading: Text("${l2[index]['qid']}"),
                          //title:  Text("${l1[index]['catname']}"),
                          title:  Text("${l2[index]['quotes']}"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}


