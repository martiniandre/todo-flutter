import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController task = TextEditingController();
  List<dynamic> taskList = [];

  void addToList(){
   setState(() {
     Random random = new Random();
     int randomNumber = random.nextInt(1500);
     Object tasks = {
       'taskText': task.text,
       'id': randomNumber
     };
     taskList.add(tasks);
     task.clear();
   });
  }

  void removeListItem(int id) {
    setState(() {
      taskList.removeWhere((element) => element['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
            color: Colors.indigoAccent,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
            child: SingleChildScrollView(
              child:  Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'What you need to do?',
                      ),
                      keyboardType: TextInputType.text,
                      controller: task,
                      maxLength: 30,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: addToList, child: Text("Adicionar")),
                    new Column(children:  taskList.map((item)=> new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item["taskText"]),
                          ElevatedButton(onPressed: () => removeListItem(item['id']), child: Text("x"))
                        ])).toList())]
              ),
            )
          )
    );
  }
}
