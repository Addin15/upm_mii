class FAQ {
  final int? id;
  final String? topic;
  final String? content;

  FAQ({this.content, this.id, this.topic});

  factory FAQ.fromJson(Map<String, dynamic> json) => FAQ(
        id: json['id'],
        topic: json['topic'],
        content: json['content'],
      );
}
