import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_8/database/note_database.dart';
import 'package:week_8/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder<NoteDatabase>(
          future: $FloorNoteDatabase.databaseBuilder("note.db").build(),
          builder: (context, data) {
            if (data.hasData) {
              Get.put(data.data!.noteDao);
              return Home();
            } else if (data.hasError) {
              return Text("Error");
            } else
              return Text("Loading");
          }),
    );
  }
}
