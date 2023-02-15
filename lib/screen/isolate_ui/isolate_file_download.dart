import 'package:file_downloading/screen/isolate_ui/isolate_info.dart';
import 'package:file_downloading/screen/isolate_ui/isolate_single_download.dart';
import 'package:flutter/material.dart';

class IsolateFileDownload extends StatefulWidget {
  const IsolateFileDownload({super.key});

  @override
  State<IsolateFileDownload> createState() => _IsolateFileDownloadState();
}

class _IsolateFileDownloadState extends State<IsolateFileDownload> {
  int doublePress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate')),
      body: ListView.builder(
        itemCount: fileData.length,
        itemBuilder: (context, index) {
          var  singleFile = fileData[index];
          return IsolateSingleDownload(isolateInfo: singleFile,index: index+1,);
        })
    );
  }
}