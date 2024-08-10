import 'package:equatable/equatable.dart';

class VideoStats extends Equatable {
  final String videoLenght;
  final String viewsCount;

  const VideoStats({
    required this.videoLenght,
    required this.viewsCount,
  });

  @override
  List<Object?> get props => [videoLenght, viewsCount];

  factory VideoStats.fromJson(Map<String, dynamic> json) {
    return VideoStats(
      videoLenght: json['lengthSeconds'],
      viewsCount: json['viewCount'],
    );
  }
}
