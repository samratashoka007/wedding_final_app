class WeddingModel{
  final int userId;
  final int id;
  final String title;
  final String body;
  final String image_url;

  WeddingModel({this.userId, this.id, this.title,this.body,this.image_url});

/*  factory WeddingModel.fromJson(Map<String, dynamic> json) {
    return WeddingModel(
      userId: json['albumId'],

      id: json['id'],
      title: json['title'],
      body: json['title'],
      image_url: json['url'],
    );
  }*/
  factory WeddingModel.fromJson(Map<String, dynamic> json) {
    return new WeddingModel(
      userId: json['albumId'],
      id: json['id'],
      title: json['title'],
      body: json['title'],
      image_url: json['url'],
    );
  }
}