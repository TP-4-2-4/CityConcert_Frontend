class TicketModel {
  int? id;
  double? price;
  String? seat;
  String? status;
  String? purchaseDate;
  int? userId;
  int? eventId;

  TicketModel(
      {this.id,
        this.price,
        this.seat,
        this.status,
        this.purchaseDate,
        this.userId,
        this.eventId});

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    seat = json['seat'];
    status = json['status'];
    purchaseDate = json['purchaseDate'];
    userId = json['userId'];
    eventId = json['eventId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['price'] = price;
    data['seat'] = seat!;
    data['status'] = status!;
    data['purchaseDate'] = purchaseDate!;
    data['userId'] = userId;
    data['eventId'] = eventId;
    return data;
  }
}