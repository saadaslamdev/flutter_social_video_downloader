class AppConstants {
  static const String baseUrl =
      "https://social-media-video-downloader.p.rapidapi.com";
  static const String getVideoEndpoint = "/smvd/get/all";
  static const int navigateTime = 3000;
  static const int animationTime = 2000;
  static final int socialPlatformsCount = SocialPlatform.values.length;

}

enum SocialPlatform { tiktok, instagram, snapchat, youtube, facebook }
