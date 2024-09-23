import 'package:equatable/equatable.dart';

class VideoLink extends Equatable {
  final String quality;
  final String link;

  const VideoLink({
    required this.quality,
    required this.link,
  });

  @override
  List<Object?> get props => [quality, link];

  factory VideoLink.fromJson(Map<String, dynamic> json) {
    return VideoLink(
      quality: json['quality'],
      link: json['link'],
    );
  }
}
