# 📱 Social Saver

**Social Saver** is a powerful video downloader application built using Flutter, enabling users to download videos from multiple social media platforms including Instagram, YouTube, YouTube Shorts, TikTok, and Facebook.

## 📷 App Previews

| Splash Screen | Home (Light Mode) | Home (Dark Mode) |
| :-----------: | :---------------: | :--------------: |
| ![Splash](./assets/images/app_previews/splash_screen.JPG) | ![Home Light](./assets/images/app_previews/home_light_mode.JPG) | ![Home Dark](./assets/images/app_previews/home_dark_mode.JPG) |

| Get Download Links | Select Download Links | Downloading Screen |
| :----------------: | :-------------------: | :----------------: |
| ![Get Download](./assets/images/app_previews/get_download_links.JPG) | ![Select Download](./assets/images/app_previews/select_download_links.JPG) | ![Downloading](./assets/images/app_previews/downlaoding.JPG) |

---

## 🚀 Features

- Download videos from Instagram, YouTube, YouTube Shorts, TikTok, and Facebook by link
- Open video after a successful download
- Retry download in case of failure
- Create a specific folder for downloaded videos
- Save videos to the gallery

---

## 🛠️ State Management & Architecture

- Uses **Bloc** for state management
- Follows **clean architecture** principles and **clean code** best practices

---

## 📦 Packages Used

- [**get_it**](https://pub.dev/packages/get_it) – Dependency injection
- [**internet_connection_checker**](https://pub.dev/packages/internet_connection_checker) – Check internet connection
- [**dartz**](https://pub.dev/packages/dartz) – Functional programming
- [**equatable**](https://pub.dev/packages/equatable) – Value equality for Dart objects
- [**dio**](https://pub.dev/packages/dio) – For API requests and video downloads
- [**permission_handler**](https://pub.dev/packages/permission_handler) – Manage permissions
- [**open_file**](https://pub.dev/packages/open_file) – Open videos after downloading
- [**path_provider**](https://pub.dev/packages/path_provider) – Get app paths for saving videos
- [**gallery_saver**](https://pub.dev/packages/gallery_saver) – Save videos to the gallery

---

Enjoy downloading your favorite videos from various social media platforms easily and directly with **Social Saver**!
