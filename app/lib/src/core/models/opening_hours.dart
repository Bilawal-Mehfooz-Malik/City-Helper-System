class OpeningHours {
  final String day;
  final String open;
  final String close;

  const OpeningHours({
    required this.day,
    required this.open,
    required this.close,
  });

  Map<String, dynamic> toJson() => {'day': day, 'open': open, 'close': close};

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
    day: json['day'] as String,
    open: json['open'] as String,
    close: json['close'] as String,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpeningHours &&
          day == other.day &&
          open == other.open &&
          close == other.close;

  @override
  int get hashCode => day.hashCode ^ open.hashCode ^ close.hashCode;
}
