class AppConstants {
  static const String baseUrl =
      "https://tiktok-download-without-watermark.p.rapidapi.com";
  static const String getVideoEndpoint = "/analysis";
  static const int navigateTime = 3000;
  static const int animationTime = 2000;
  static final int socialPlatformsCount = SocialPlatform.values.length;

}

enum SocialPlatform { tiktok, instagram, snapchat, youtube, facebook }
