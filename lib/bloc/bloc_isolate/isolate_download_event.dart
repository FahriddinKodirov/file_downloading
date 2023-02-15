abstract class IsolateDownloadEvent {}

class FetchIsolateFile extends IsolateDownloadEvent {
  final String fileName;
  final String fileUrl;
  final double progress;

 FetchIsolateFile({
            required this.fileName,
            required this.fileUrl,
            required this.progress
            });
}
