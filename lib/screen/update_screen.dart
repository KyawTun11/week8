import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_8/database/note_table.dart';
import 'package:week_8/database/notedao.dart';

class UpdateScreen extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    Note note = Get.arguments;
    title.text = note.title;
    message.text = note.message;
    return Scaffold(
      appBar: AppBar(
        title: Text("UpDate Note"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: message,
              decoration: InputDecoration(
                hintText: "Message",
                border: OutlineInputBorder(),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Update Note"),
              onPressed: () {
                noteDao.updateNote(Note(title.text, message.text, id: note.id));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
