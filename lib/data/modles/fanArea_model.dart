class FanModel {
  String? userId;
  String? dateTime;
  String? name;
  String? postImage;
  String? postVideo;
  String? text;
  String? image;

  FanModel(
      {this.userId,
      this.dateTime,
      this.name,
      this.postImage,
      this.postVideo,
      this.text,
      this.image});

  FanModel.formJson(Map<String, dynamic> json) {
    userId = json['userId'];
    dateTime = json['dateTime'];
    name = json['name'];
    postImage = json['postImage'];
    postVideo = json['postVideo'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'dateTime': dateTime,
      'name': name,
      'postImage': postImage,
      'postVideo': postVideo,
      'text': text,
      'image': image,
    };
  }
}
