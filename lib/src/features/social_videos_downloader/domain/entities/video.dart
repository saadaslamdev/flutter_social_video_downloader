import 'package:equatable/equatable.dart';

import 'video_link.dart';

class Video extends Equatable {
  final bool success;
  final String? message;
  final String srcUrl;
  final String? ogUrl;
  final String title;
  final String? picture;
  final List<String>? images;
  final String? timeTaken;
  final String rId;
  final List<VideoLink> videoLinks;

  const Video({
    required this.success,
    required this.message,
    required this.srcUrl,
    required this.ogUrl,
    required this.title,
    required this.picture,
    required this.images,
    required this.timeTaken,
    required this.rId,
    required this.videoLinks,
  });

  @override
  List<Object?> get props => [
        success,
        message,
        srcUrl,
        ogUrl,
        title,
        picture,
        images,
        timeTaken,
        rId,
        videoLinks,
      ];

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      success: json['success'],
      message: json['message'] ?? "",
      srcUrl: json['src_url'],
      ogUrl: json['og_url'] ?? "",
      title: json['title'],
      picture: json['picture'] ?? "",
      images: List<String>.from(json['images'] ?? []),
      timeTaken: json['timeTaken'] ?? "",
      rId: json['r_id'],
      videoLinks: (json['links'] as List)
          .map((linkJson) => VideoLink.fromJson(linkJson))
          .toList(),
    );
  }
}
