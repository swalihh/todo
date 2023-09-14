import 'package:flutter/material.dart';

class adding extends StatefulWidget {
  const adding({super.key});

  @override
  State<adding> createState() => _addingState();
}

class _addingState extends State<adding> {
  TextEditingController namecontroller =TextEditingController();
  TextEditingController notecontroller =TextEditingController();
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
              controller: namecontroller,
              decoration: InputDecoration(hintText: 'name'),
            ),
             TextFormField(
              controller: notecontroller,
              decoration: InputDecoration(hintText: 'note'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  void submitData(){
 //to get data from server
    final name =namecontroller.text;
    final note = notecontroller.text;
    final body ={
  "name" : name,
  "note" :note,
  "is_completed":false,

    };

  }
}
