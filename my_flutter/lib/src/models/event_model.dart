
class EventModel {
  int? id;
  String? name;
  String? startTime;
  String? ticketLimit;
  String? ticketPrice;
  String? status;
  String? genreDescriptors;
  String? image;
  String? description;
  int? venue;

  EventModel(
      {this.id,
        this.name,
        this.startTime,
        this.ticketLimit,
        this.ticketPrice,
        this.status,
        this.genreDescriptors,
        this.image,
        this.description,
        this.venue});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startTime = json['startTime'];
    ticketLimit = json['ticketLimit'];
    ticketPrice = json['ticketLimit'];
    status = json['status'];
    genreDescriptors = json['genreDescriptors'];
    var imgArray = json['image'];
    // todo: byte array implementation
    image = imgArray;
    description = json['description'];
    venue = json['venue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['startTime'] = this.startTime;
    data['ticketLimit'] = this.ticketLimit;
    data['ticketPrice'] = this.ticketPrice;
    data['status'] = this.status;
    data['genreDescriptors'] = this.genreDescriptors;
    data['image'] = this.image;
    data['description'] = this.description;
    data['venue'] = this.venue;
    return data;
  }
}