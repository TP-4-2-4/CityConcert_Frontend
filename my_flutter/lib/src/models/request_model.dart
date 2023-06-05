class RequestModel {
  int? id;
  int? userId;
  int? eventId;
  String? requestType;
  String? description;
  String? currentSeat;
  String? wantedSeat;
  String? seatFromUser;

  RequestModel(
      {this.id,
        this.userId,
        this.eventId,
        this.requestType,
        this.description,
        this.currentSeat,
        this.wantedSeat,
        this.seatFromUser});

  RequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    eventId = json['eventId'];
    requestType = json['requestType'];
    description = json['description'];
    currentSeat = json['currentSeat'];
    wantedSeat = json['wantedSeat'];
    seatFromUser = json['seatFromUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['eventId'] = eventId;
    data['requestType'] = requestType;
    data['description'] = description;
    data['currentSeat'] = currentSeat;
    data['wantedSeat'] = wantedSeat;
    data['seatFromUser'] = seatFromUser;
    return data;
  }
}