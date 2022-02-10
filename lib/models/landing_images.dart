class LandingContent {
  String image;
  String title;

  LandingContent({required this.image, required this.title});
}

List<LandingContent> contents = [
  LandingContent(
      image: "assets/images/videocall.png", title: "Start or join meeting"),
  LandingContent(
      image: "assets/images/chat.png", title: "Inbuilt chat functionality"),
  LandingContent(
      image: "assets/images/screenshare.png", title: "Share your screen"),
  LandingContent(
      image: "assets/images/start.png", title: "Get started")
];
