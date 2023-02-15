import 'package:equatable/equatable.dart';

class FileInfo extends Equatable {
  final String fileName;
  final String fileUrl;
  final double progress;

  const FileInfo({
            required this.fileName,
            required this.fileUrl,
            required this.progress
        });

FileInfo copyWith({
  String? fileName,
  String? fileUrl,
  double? progress
}) => 
   FileInfo(
    fileName: fileName ?? this.fileName, 
    fileUrl: fileUrl ?? this.fileUrl, 
    progress: progress?? this.progress
    );

  @override
  List<Object?> get props => [
    fileName,
    fileUrl,
    progress
  ];

}
 List<FileInfo> fileData  = [
  const FileInfo(
    fileName: 'Pythonbook',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const FileInfo(
    fileName: 'butterfly',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const FileInfo(
    fileName: 'sabyan va rahmon',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const FileInfo(
    fileName: 'ajoyib rasm',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const FileInfo(
    fileName: 'foydali file',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),

 ];
