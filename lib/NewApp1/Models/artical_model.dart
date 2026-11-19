class ArticalModel {
  final String imgeUrl;
  final String title;
  final String description;
  final String author;
  final String article;
  final String publishAt;

  new({
    required this.imgeUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.article,
    required this.publishAt,
  });
}

class Articles {
  List<ArticalModel> articles;
  Articles({required this.articles});
  factory Articles.fromjson(Map<String, dynamic> json) {
    final tempList = json["articles"]
        .map<ArticalModel>(
          (article) => ArticalModel(
            imgeUrl: article["urlToImge"] ?? "",
            title: article["title"] ?? "",
            description: article["description"] ?? "",
            author: article["author"] ?? "",
            article: article["content"] ?? "",
            publishAt: article["publishedAt"] ?? "",
          ),
        )
        .toList();
    return Articles(articles: tempList);
  }
}
