import 'dart:convert';  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class adding extends StatefulWidget {

  @override
  State<adding> createState() => _addingState();
}

class _addingState extends State<adding> {
  TextEditingController titlecontroller =TextEditingController();
  TextEditingController descriptioncontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add here'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            TextFormField(
              controller: titlecontroller,
              decoration: InputDecoration(hintText: 'title'),
            ),
             TextFormField(
              controller: descriptioncontroller,
              decoration: InputDecoration(hintText: 'description'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: submitData, child: Text('Submit'))
          ],
        ),
      ),
    );
  }

 Future submitData()async {
 //to get data from server
    final title =titlecontroller.text;
    final description = descriptioncontroller.text;
    final body ={
  "title" :title ,
  "description" :description,
  "is_completed":false,

    };


    //submit data to server
    final url ='https://api.nstack.in/v1/todos';
    final uri =Uri.parse(url);
     final responce  = await http.post(
     uri,
     body:jsonEncode(body), 
     headers: {
      'Content-Type': 'application/json'
     }
     );
 
   //show success or fail message
  if(responce.statusCode ==201){
    titlecontroller.text=='';
    descriptioncontroller.text=='';
   print('success');
   showsuccessMessenger('success');
  }else{
    print('failed');
   showerrorMessenger('failed to add');
  }
   
 }  
 void  showsuccessMessenger(String message){
  final snackBar =SnackBar(content: Text(message,
  style: TextStyle(color: Colors.white),
  ),
  backgroundColor: Color.fromARGB(255, 10, 102, 33),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
 void  showerrorMessenger(String message){
  final snackBar =SnackBar(content: Text(message,
  style: TextStyle(color: Colors.white),
  ),
  backgroundColor: Color.fromARGB(255, 102, 10, 10),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
 

}
