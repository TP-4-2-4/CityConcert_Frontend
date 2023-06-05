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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['eventId'] = this.eventId;
    data['requestType'] = this.requestType;
    data['description'] = this.description;
    data['currentSeat'] = this.currentSeat;
    data['wantedSeat'] = this.wantedSeat;
    data['seatFromUser'] = this.seatFromUser;
    return data;
  }
}