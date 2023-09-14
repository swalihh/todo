import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';

void main() {
  runApp(const Myapp());
  
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
       theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
      ),
      home:home() ,);
  }
}