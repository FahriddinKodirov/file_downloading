import 'package:file_downloading/bloc/file_manager_bloc.dart';
import 'package:file_downloading/bloc/file_manager_event.dart';
import 'package:file_downloading/bloc/file_manager_state.dart';
import 'package:file_downloading/screen/file_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_safe/open_file_safe.dart';

class SingleFileDownloading extends StatelessWidget {
  final FileInfo fileInfo;

 SingleFileDownloading({super.key, required this.fileInfo});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileManagerBloc(),
      child: BlocBuilder<FileManagerBloc, FileManagerState>(
        builder:(context, state) {
         return ListTile(
          leading: state.newFileLocation.isEmpty
           ? const Icon(Icons.download)
           : const Icon(Icons.download_done),
          title: Text('Downloaded: ${state.progress * 100} %'),
          subtitle: LinearProgressIndicator(
            value: state.progress,
            backgroundColor: Colors.black,
          ),
          onTap: () {
            // ignore: avoid_single_cascade_in_expression_statements
            context
               .read<FileManagerBloc>()
               ..add(FetchFileManager(fileName: fileInfo.fileName, fileUrl: fileInfo.fileUrl, progress: fileInfo.progress));

          },
          trailing: IconButton(
            onPressed: () {git commit -m "first commit"
              if(state.newFileLocation.isNotEmpty){
                print(state.newFileLocation);
                OpenFile.open(state.newFileLocation);
              }
            },
            icon: const Icon(Icons.file_open)),
         );
        },),
    );
  }
}