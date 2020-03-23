class EventsData {
  int id;
  final String name, imageUrl,  propellant;

  EventsData({
    this.id,
    this.name,
    this.imageUrl,
    this.propellant,
  });


/*  factory EventsData.fromJson(Map<String, dynamic> json) {
    return EventsData(
        id: json['id'],
        flowerName: json['flower_name'],
        flowerImageURL: json['flower_image_url']



  String get imageUrl => null;    );
  }*/

  factory EventsData.fromJson(Map<String, dynamic> jsonData) {
    return EventsData(
      id: jsonData['id'],
      name: jsonData['flower_name'],
      propellant: jsonData['propellant'],
      imageUrl: jsonData['flower_image_url'],
    );
  }
}