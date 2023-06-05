class RequestModel {
  int? userId;
  int? eventId;
  String? requestType;
  String? description;
  String? currentSeat;
  String? wantedSeat;
  String? seatFromUser;

  RequestModel(
      {this.userId,
        this.eventId,
        this.requestType,
        this.description,
        this.currentSeat,
        this.wantedSeat,
        this.seatFromUser});

  RequestModel.fromJson(Map<String, dynamic> json) {
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