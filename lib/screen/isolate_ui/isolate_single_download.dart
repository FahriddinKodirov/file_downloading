import 'package:file_downloading/bloc/bloc_isolate/isloate_download_state.dart';
import 'package:file_downloading/bloc/bloc_isolate/isolate_download_bloc.dart';
import 'package:file_downloading/bloc/bloc_isolate/isolate_download_event.dart';
import 'package:file_downloading/date/local_notification_service.dart';
import 'package:file_downloading/screen/isolate_ui/isolate_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_safe/open_file_safe.dart';

class IsolateSingleDownload extends StatefulWidget {
  final IsolateInfo isolateInfo;
  final int index;

   IsolateSingleDownload({super.key, required this.isolateInfo, required this.index});

  @override
  State<IsolateSingleDownload> createState() => _IsolateSingleDownloadState();
}

class _IsolateSingleDownloadState extends State<IsolateSingleDownload> {
   int currentId = 1;

   int currentIdTwo = 1;
   bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IsolateDownloadBloc(),
      child: BlocBuilder<IsolateDownloadBloc, IsolateDownloadState>(
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
               .read<IsolateDownloadBloc>()
               ..add(FetchIsolateFile(fileName: widget.isolateInfo.fileName, fileUrl: widget.isolateInfo.fileUrl, progress: widget.isolateInfo.progress));
         currentId++;
                
            print('--------------------.${state.progress}');
            setState(() {
              LocalNotificationService.localNotificationService
                    .showNotification(id: currentId,index: widget.index);
              
             state.isTrue?LocalNotificationService.localNotificationService
                    .showNotificationTwo(id: currentIdTwo):null;
              
            });
          },
          trailing: IconButton(
            onPressed: () {
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