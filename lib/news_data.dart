class News {
  final String? author;
  final String? title;
  final String? description;
  final String? content;
  final String? image;
  final String? url;
  final String? publishedAt;

  News(
      {this.author,
      this.title,
      this.description,
      this.content,
      this.image,
      this.url,
      this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        content: json["content"],
        image: json["urlToImage"],
        url: json["url"],
        publishedAt: json["publishedAt"]);
  }
}
