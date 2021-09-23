import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_8/database/note_table.dart';
import 'package:week_8/database/notedao.dart';
import 'package:week_8/screen/add_screen.dart';
import 'package:week_8/screen/update_screen.dart';

class Home extends StatelessWidget {
  final NoteDao noteDao = Get.find();
  List<Note> notes = [];
  Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floor DataBase"),
        centerTitle: true,
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () {
              Get.to(() => AddScreen());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "delete",
            onPressed: () {
              noteDao.deleteAllNotes(notes);
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      stream: noteDao.getAllNotes(),
      builder: (_, data) {
        if (data.hasData) {
          notes = data.data!;
          return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (_, position) {
              return Card(
                child: ListTile(
                  title: Text(data.data![position].title),
                  subtitle: Text(data.data![position].message),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      noteDao.deleteNote(data.data![position]);
                    },
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.to(UpdateScreen(), arguments: data.data![position]);
                    },
                  ),
                ),
              );
            },
          );
        } else if (data.hasError) {
          return Text("Error");
        } else
          return Text("Loading");
      },
    );
  }
}
