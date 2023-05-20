class VenueModel {
  int? id;
  String? name;
  String? location;
  String? description;
  int? capacity;
  List<String>? image;

  VenueModel(
      {this.id,
        this.name,
        this.location,
        this.description,
        this.capacity,
        this.image});

  VenueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    capacity = json['capacity'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['capacity'] = this.capacity;
    data['image'] = this.image;
    return data;
  }
}