class EventModel {
  final int id;
  final String name;
  final String date;
  final String content;
  final String image;
  final List<String> videosUrls;

  EventModel({
    required this.videosUrls,
    required this.name,
    required this.image,
    required this.content,
    required this.id,
    required this.date
  });

  factory EventModel.fromJson(Map<String, dynamic> data) {
    return EventModel(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      content: data['content'],
      date: data['date'],
      videosUrls: (data['videos'] as List<dynamic>?)
          ?.map((video) => video['video'].toString())
          .toList() ??
          [],
    );
  }

  @override
  String toString() {
    return 'EventModel(name: $name, image: $image, content: $content, videosUrls: $videosUrls)';
  }
}
