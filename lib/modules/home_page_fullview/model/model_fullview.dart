class BookingResponse {
  BookingResponse({
    this.status,
    this.data,
  });

  bool? status;
  List<BookingList>? data;

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        status: json["status"],
        data: List<BookingList>.from(
            json["data"].map((x) => BookingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BookingList {
  BookingList({
    this.id,
    this.bookingDate,
    this.turfId,
    this.timeSlot,
  });

  String? id;
  String? bookingDate;
  String? turfId;
  List<int>? timeSlot;

  factory BookingList.fromJson(Map<String, dynamic> json) => BookingList(
        id: json["_id"],
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(json["time_slot"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "booking_date": bookingDate,
        "turf_id": turfId,
        "time_slot": List<dynamic>.from(timeSlot!.map((x) => x)),
      };
}
