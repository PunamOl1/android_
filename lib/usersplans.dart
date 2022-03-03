import 'package:api/constant.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _todoappState createState() => _todoappState();
}

class _todoappState extends State<Todo> {
  var value;
  var listtodo = [''];

  //String value;

  addtodo(String item) {
    setState(() {
      listtodo.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: Text("Your TODO Plans"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addtodo(value);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: listtodo.length,
          itemBuilder: (context, index) {
            return index == 0
                ? TextFormField(
                    decoration: InputDecoration(
                        hintText: "Add your health plan",
                        hintStyle: TextStyle(color: Colors.white)),
                    onChanged: (val) {
                      value = val;
                    },
                  )
                : ListTile(
                    leading: Icon(Icons.work),
                    title: Text('${listtodo[index]}'),
                  );
          }),
    );
  }
}
























// // class TodoApp extends StatefulWidget {
// //   const TodoApp({Key? key}) : super(key: key);

// //   @override
// //   _TodoAppState createState() => _TodoAppState();
// // }

// // class _TodoAppState extends State<TodoApp> {
// //   late String value;

// //   var Todo = [""];

// //   get item => null;

// //   addtodo(String, item) {
// //     setState(() {
// //       Todo.add(item);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(" TOdoApp"),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           setState(() {
// //             addtodo(String, item);
// //           });
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //       body: ListView.builder(
// //           itemCount: Todo.length,
// //           itemBuilder: (context, index) {
// //             return index == 0
// //                 ? Padding(
// //                     padding: const EdgeInsets.all(19.0),
// //                     child: TextFormField(
// //                       onChanged: (val) {},
// //                     ),
// //                   )
// //                 : ListTile(
// //                     leading: Icon(Icons.work),
// //                     title: Text('${Todo[index]}'));
// //           }),
// //     );
// //   }
// // }
