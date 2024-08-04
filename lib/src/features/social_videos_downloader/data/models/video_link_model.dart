import '../../domain/entities/video_link.dart';

class VideoLinkModel extends VideoLink {
  const VideoLinkModel({
    required super.quality,
    required super.link,
  });

  factory VideoLinkModel.fromJson(Map<String, dynamic> json) {
    return VideoLinkModel(
      quality: json["quality"],
      link: json["link"],
    );
  }
}
