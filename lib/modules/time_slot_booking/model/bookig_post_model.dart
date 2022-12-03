class BookingPostModel {
  BookingPostModel({
    this.bookingDate,
    this.turfId,
    this.timeSlot,
  });

  String? bookingDate;
  String? turfId;
  List<int>? timeSlot;

  factory BookingPostModel.fromJson(Map<String, dynamic> json) =>
      BookingPostModel(
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(json["time_slot"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "booking_date": bookingDate,
        "turf_id": turfId,
        "time_slot": List<dynamic>.from(timeSlot!.map((x) => x)),
      };
}
