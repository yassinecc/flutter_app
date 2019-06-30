class Comic {
  final int id;
  final String title;
  final String url;

  Comic({this.id, this.title, this.url});

  factory Comic.fromApi(Map<String, dynamic> json) {
    return Comic(id: json["num"], title: json['title'], url: json['img']);
  }
}
