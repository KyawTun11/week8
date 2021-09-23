import 'package:floor/floor.dart';
import 'package:week_8/database/note_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:week_8/database/notedao.dart';

part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
