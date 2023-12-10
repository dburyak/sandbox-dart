void main() {
  // https://medium.com/flutter-community/working-with-dates-in-dart-e81c70911811

  // DateTime always captures time zone information
  // DateTime.now() captures local time zone, not UTC, and prints it localized
  // DateTime has microsecond precision
  var now = DateTime.now();
  print('now: $now');
  print('tz : ${now.timeZoneName}');
  print('tz offset : ${now.timeZoneOffset}');

  // toUtc() converts time to UTC time zone
  var nowUtc = DateTime.now().toUtc();
  print('nowUtc: $nowUtc');
  print('tz : ${nowUtc.timeZoneName}');
  print('tz offset : ${nowUtc.timeZoneOffset}');

  // toLocal() converts time to local time zone
  var nowLocal = nowUtc.toLocal();
  print('nowLocal: $nowLocal');
  print('tz : ${nowLocal.timeZoneName}');
  print('tz offset : ${nowLocal.timeZoneOffset}');

  // lots of properties allow to get individual parts of the date
  print('year: ${now.year}');
  print('month: ${now.month}');
  print('day: ${now.day}');
  // ... and so on

  // Duration is a difference between two dates
  var inTwoHours = now.add(Duration(hours: 2));
  print('inTwoHours: $inTwoHours');
  var duration = Duration(days: 1, hours: 2, minutes: 3, seconds: 4, milliseconds: 5, microseconds: 6);
  print('duration: $duration');
  print('duration in seconds: ${duration.inSeconds}');
  var afterDuration = now.add(duration);
  print('afterDuration: $afterDuration');
}
