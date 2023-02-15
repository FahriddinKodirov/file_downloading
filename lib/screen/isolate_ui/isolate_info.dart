import 'package:equatable/equatable.dart';

class IsolateInfo extends Equatable {
  final String fileName;
  final String fileUrl;
  final double progress;

  const IsolateInfo({
            required this.fileName,
            required this.fileUrl,
            required this.progress
        });

IsolateInfo copyWith({
  String? fileName,
  String? fileUrl,
  double? progress
}) => 
   IsolateInfo(
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
 List<IsolateInfo> fileData  = [
  const IsolateInfo(
    fileName: 'Pythonbook',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const IsolateInfo(
    fileName: 'butterfly',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const IsolateInfo(
    fileName: 'sabyan va rahmon',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const IsolateInfo(
    fileName: 'ajoyib rasm',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),
  const IsolateInfo(
    fileName: 'foydali file',  
    fileUrl: 'http://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf', 
    progress: 0.0
    ),

 ];
