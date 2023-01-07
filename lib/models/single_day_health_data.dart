class SingleDayHealthData {
  DateTime date;
  String frontPicture;
  String backPicture;
  double? weight;

  SingleDayHealthData({
    required this.date,
    required this.frontPicture,
    required this.backPicture,
    this.weight,
  });
}
