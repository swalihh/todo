import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'adding_Page.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isloading = false;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo')),
      floatingActionButton: FloatingActionButton(
        child: Text('Add'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return adding();
            },
          ));
        },
      ),
      body: Visibility(
        visible: isloading,
        child: Center(
          child: CircularProgressIndicator(),
        ),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'] as String;
              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(item['title']), 
                subtitle: Text(item['description']),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if(value=='edit'){
                      //open edit page
                    } else if(value == 'delete'){
                      // delete the item

                     // deleteByid()
                    }
                    
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(child: Text('edit')
                      ,value: 'edit',
                      ),
                      PopupMenuItem(child: Text('delete')
                      ,value:'delete',
                      ),
                    ];
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

Future <void> deleteByid(String id)async{
//delete the item



//remove the item from the list
}

  Future<void> fetchTodo() async {
    final Url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(Url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    }
    setState(() {
      isloading = false;
    });
  }
  
    
}
