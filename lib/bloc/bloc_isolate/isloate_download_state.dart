import 'package:equatable/equatable.dart';

class IsolateDownloadState extends Equatable {
  final double progress;
  final String newFileLocation;
  final bool isTrue;


  const IsolateDownloadState({
    required this.progress,
    required this.newFileLocation,
    required this.isTrue
  });

  IsolateDownloadState copyWith({
    double? progress,
    String? newFileLocation,
    bool? isTrue
  }) => 
     IsolateDownloadState(
      progress: progress ?? this.progress, 
      newFileLocation: newFileLocation ?? this.newFileLocation,
      isTrue: isTrue ?? this.isTrue
      );

  @override
  List<Object?> get props => [
     progress,
     newFileLocation,
     isTrue
  ];
}