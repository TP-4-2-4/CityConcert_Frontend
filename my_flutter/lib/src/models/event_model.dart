class event_model {
  int? _id;
  String? _name;
  String? _startTime;
  int? _ticketLimit;
  String? _status;
  String? _genreDescriptors;
  List<String>? _image;
  String? _description;
  int? _venue;

  event_model(
      {int? id,
      String? name,
      String? startTime,
      int? ticketLimit,
      String? status,
      String? genreDescriptors,
      List<String>? image,
      String? description,
      int? venue}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (startTime != null) {
      this._startTime = startTime;
    }
    if (ticketLimit != null) {
      this._ticketLimit = ticketLimit;
    }
    if (status != null) {
      this._status = status;
    }
    if (genreDescriptors != null) {
      this._genreDescriptors = genreDescriptors;
    }
    if (image != null) {
      this._image = image;
    }
    if (description != null) {
      this._description = description;
    }
    if (venue != null) {
      this._venue = venue;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get name => _name;

  set name(String? name) => _name = name;

  String? get startTime => _startTime;

  set startTime(String? startTime) => _startTime = startTime;

  int? get ticketLimit => _ticketLimit;

  set ticketLimit(int? ticketLimit) => _ticketLimit = ticketLimit;

  String? get status => _status;

  set status(String? status) => _status = status;

  String? get genreDescriptors => _genreDescriptors;

  set genreDescriptors(String? genreDescriptors) =>
      _genreDescriptors = genreDescriptors;

  List<String>? get image => _image;

  set image(List<String>? image) => _image = image;

  String? get description => _description;

  set description(String? description) => _description = description;

  int? get venue => _venue;

  set venue(int? venue) => _venue = venue;

  event_model.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _startTime = json['startTime'];
    _ticketLimit = json['ticketLimit'];
    _status = json['status'];
    _genreDescriptors = json['genreDescriptors'];
    _image = json['image'].cast<String>();
    _description = json['description'];
    _venue = json['venue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['startTime'] = this._startTime;
    data['ticketLimit'] = this._ticketLimit;
    data['status'] = this._status;
    data['genreDescriptors'] = this._genreDescriptors;
    data['image'] = this._image;
    data['description'] = this._description;
    data['venue'] = this._venue;
    return data;
  }
}
