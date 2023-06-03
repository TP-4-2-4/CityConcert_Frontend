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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['seat'] = this.seat;
    data['status'] = this.status;
    data['purchaseDate'] = this.purchaseDate;
    data['userId'] = this.userId;
    data['eventId'] = this.eventId;
    return data;
  }
}