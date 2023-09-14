import 'package:flutter/material.dart';

import 'adding_Page.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:Text('Todo')
      ),
    floatingActionButton: FloatingActionButton(
      child: Text('Add'),
      onPressed:() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return adding();
      },));
    },),
    );
  }
} 