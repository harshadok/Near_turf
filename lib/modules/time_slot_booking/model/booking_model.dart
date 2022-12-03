class BookingPostModelresponce {
  BookingPostModelresponce({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory BookingPostModelresponce.fromJson(Map<String, dynamic> json) =>
      BookingPostModelresponce(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
