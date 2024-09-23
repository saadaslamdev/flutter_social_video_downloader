part of 'downloader_bloc.dart';

abstract class DownloaderEvent extends Equatable {
  const DownloaderEvent();
}

class DownloaderGetVideo extends DownloaderEvent {
  final String videoLink;

  const DownloaderGetVideo(this.videoLink);

  @override
  List<Object?> get props => [videoLink];
}

class DownloaderSaveVideo extends DownloaderEvent {
  final Video video;
  final String selectedLink;

  const DownloaderSaveVideo({required this.video, required this.selectedLink});

  @override
  List<Object?> get props => [video];
}

class LoadOldDownloads extends DownloaderEvent {
  @override
  List<Object?> get props => [];
}
