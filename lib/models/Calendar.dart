class Calendar{
  String place;
  String week;
  int dayTime;
  int day;
  int from;
  int to;
  Calendar(
  {
    this.place,
    this.week,
    this.dayTime,
    this.day,
    this.from,
    this.to
  });

  Calendar.fromJS(Map<String,dynamic> map){
    this.place = map['place'];
    this.week = map['week'];
    this.dayTime = map['dayTime'];
    this.day = map['day'];
    this.from = map['from'];
    this.to = map['to'];
  }



}