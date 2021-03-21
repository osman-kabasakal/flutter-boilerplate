import 'package:flutter_exercies/core/bloc/reactive_bloc.dart';
import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class DatabaseContext implements ReactiveBehaviorSubjectBloc<Database> {
  DatabaseContext() {}
  @override
  void dispose() {
    subject!.close();
  }

  @override
  Subject<Database>? subject = BehaviorSubject<Database>();

  @override
  Stream<Database> get subjectStream => subject!.stream.asBroadcastStream();

  Future open() async {
    try {
      var databasesPath = await getDatabasesPath();

      //TODO: database file name eklenecek.
      var path = join(databasesPath, "");

      var exists = await databaseExists(path);

      if (!exists) {
        try {
          await Directory(dirname(path)).create(recursive: true);
        } catch (_) {}

        // Copy from asset
        //TODO: Eğer hazır db varsa onun yolu eklenecek
        ByteData data = await rootBundle.load(join("assets", ""));

        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        await File(path).writeAsBytes(bytes, flush: true);
      } else {}
      final database = await openDatabase(
        path,
        version: 0,
        readOnly: false,
        singleInstance: true,
        onUpgrade: databaseOnUpgrade,
      );
      if (!migrate) {
        //TODO: migrate edilmemiş.
      }
      subject!.sink.add(database);
    } catch (e) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  bool migrate = false;
  final List<List<String>> migrationScripts = [];
  Future<void> databaseOnUpgrade(
      Database database, int oldversion, int version) async {
    try {
      for (var i = oldversion; i < version; i++) {
        for (var item in migrationScripts[i]) {
          try {
            await database.rawQuery(item);
          } catch (e) {
            continue;
          }
        }
      }
      migrate = true;
      return;
    } catch (e) {}
  }
}
