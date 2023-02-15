import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:file_downloading/bloc/bloc_isolate/isloate_download_state.dart';
import 'package:file_downloading/bloc/bloc_isolate/isolate_download_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class IsolateDownloadBloc extends Bloc<IsolateDownloadEvent,IsolateDownloadState> {
  IsolateDownloadBloc(): super( const IsolateDownloadState(
    progress: 0.0, newFileLocation: '', isTrue: false,)){
       on<FetchIsolateFile>(downloadIfExists);
    }

//! ---- isolate --------
final receivePort = ReceivePort();
isolate(newFileLocation) async {
 await Isolate.spawn((Object args) async {
     Isolate.exit(args as SendPort,newFileLocation);
 },
   receivePort.sendPort,
  );
  
  var response = await receivePort.first;
  print('length ---------> ${receivePort}');
return response;
}



downloadIfExists(FetchIsolateFile event, Emitter<IsolateDownloadState> emit) async {
// ----- permissino
  bool hasPermission = await _requestWritePermission();
  if (!hasPermission) return;
  Dio dio = Dio();
// ------- path
  var directory = await getDownloadPath();
  if(directory == null) {
    return;
  }

  print('Path: ${directory.path}');
  String url = event.fileUrl;
  String newFileLocation = 
      '${directory.path}/${event.fileName}${DateTime.now().millisecond}${url.substring(url.length - 5, url.length)}';
  try {
    await dio.download(url, newFileLocation,
    onReceiveProgress: (count, total) {
      var pr = count / total;
      emit(state.copyWith(progress: pr));
      emit(state.copyWith(isTrue: pr == 1.0?true:false));
    });
    String newFile = await isolate(newFileLocation);
    emit(state.copyWith(newFileLocation: newFile));
  } catch (err) {
    debugPrint('DownLoad ERROR: $err');
  }

}

// ------------ permissin -----
Future<bool> _requestWritePermission() async {
  await Permission.storage.request();
  return await Permission.storage.request().isGranted;
}


// -------------- get path -----
Future<Directory?> getDownloadPath() async {
  Directory? directory;
  try {
    if(Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if(!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
  } catch (err) {
    debugPrint('Cannot get download folder path');
  }
  return directory;
}

}


 
 



