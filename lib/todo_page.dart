import 'package:flutter/material.dart';
import 'package:todo/style.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List TodoList = [];
  String item = '';

  MyInputOnChange(content){
    setState(() {
      item = content;
    });

  }
  AddItem(){
    setState(() {
      TodoList.add({'item':item});
    });
  }
  RemoveItem(index){
    setState(() {
      TodoList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
     print(TodoList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                        child: TextFormField(
                          onChanged: (content){MyInputOnChange(content);},
                          decoration: AppInputDecoration('List Item'),
                        )
                    ),
                    Expanded(
                      flex: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: ElevatedButton(
                      onPressed: (){
                        AddItem();
                      },
                      child: Text('Add'),
                      style: AppButtonStyle(),
                    ),
                        )
                    ),
                  ],
                )
            ),
            Expanded(
              flex: 90,
                child: ListView.builder(
                  itemCount: TodoList.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Sizebox50(
                        Row(
                          children: [
                            Expanded(flex: 80, child: Text(TodoList[index]['item'])),
                            Expanded(flex: 20, child: TextButton(onPressed: (){RemoveItem(index);},child: Icon(Icons.delete),)),
                          ],
                        )
                      ),
                    );
                  },
                )
            )
            ,
          ],
        ),
      ),
    );
  }
}
