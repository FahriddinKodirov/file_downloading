import 'dart:io';
import 'dart:async';
import 'package:file_downloading/bloc/bloc/file_manager_event.dart';
import 'package:file_downloading/bloc/bloc/file_manager_state.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  FileManagerBloc():super(
    const FileManagerState( 
            progress: 0.0,
            newFileLocation: '')){
      on<FetchFileManager>(downloadIfExists);
    }

 downloadIfExists(FetchFileManager event, Emitter<FileManagerState> emit) async {
  bool hasPermission = await _requestWritePermission();
  if (!hasPermission) return;
  Dio dio = Dio();

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
      print(pr);
      emit(state.copyWith(progress: pr));
    });
    emit(state.copyWith(newFileLocation: newFileLocation));
  } catch (err) {
    debugPrint('DownLoad ERROR: $err');
  }

}

//  downloadFile({required String fileName,required String url}) async {
//   bool hasPermission = await _requestWritePermission();
//   if (!hasPermission) return;
//   Dio dio = Dio();

//   var directory = await getDownloadPath();
//   String newFileLocation = 
//       '${directory?.path}/$fileName${url.substring(url.length - 5, url.length)}';
//   var allFiles = directory?.list();

//   List<String> filePaths = [];
//   await allFiles?.forEach((element) {
//     filePaths.add(element.path.toString());
//   });

//   if(filePaths.contains(newFileLocation)) {
//     OpenFile.open(newFileLocation);
//   } else {
//     try {
//       await dio.download(url, newFileLocation,
//       onReceiveProgress: (count, total) {
//         double pr = count / total;
//         emit(state.copyWith(progress: pr));
//       },);
//       OpenFile.open(newFileLocation);
//     } catch (err) {
//       debugPrint('DOWNLOAD ERROR: $err');
//     }
//   }


// }


Future<bool> _requestWritePermission() async {
  await Permission.storage.request();
  return await Permission.storage.request().isGranted;
}

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