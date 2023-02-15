import 'package:file_downloading/screen/ui/file_info.dart';
import 'package:file_downloading/screen/ui/single_file_downloading.dart';
import 'package:flutter/material.dart';

class FileDownloadExamaple extends StatefulWidget {
  const FileDownloadExamaple({super.key});

  @override
  State<FileDownloadExamaple> createState() => _FileDownloadExamapleState();
}

class _FileDownloadExamapleState extends State<FileDownloadExamaple> {
  int doublePress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('file downlodaing')),
      body: ListView.builder(
        itemCount: fileData.length,
        itemBuilder: (context, index) {
          var  singleFile = fileData[index];
          return SingleFileDownloading(fileInfo: singleFile,);
        })
    );
  }
}