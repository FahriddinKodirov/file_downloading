abstract class FileManagerEvent {}

class FetchFileManager extends FileManagerEvent {
  final String fileName;
  final String fileUrl;
  final double progress;

 FetchFileManager({
            required this.fileName,
            required this.fileUrl,
            required this.progress});
}