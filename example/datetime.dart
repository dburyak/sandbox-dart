import 'package:intl/intl.dart';

void main() {
  // https://medium.com/flutter-community/working-with-dates-in-dart-e81c70911811

  // DateTime always captures time offset information (not the TZ itself)
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

  _formatting();
}

_formatting() {
  var fmt = DateFormat('HH:mm');
  var now = DateTime.now();
  print('now.toString: $now');

  var formattedNow = fmt.format(now);
  print('fmt.format(now): $formattedNow');

  var alarmFmt = DateFormat('HH:mm');
  var alarmStr = "07:30";  // entered by user
  var parsedDateTime = fmt.parse(alarmStr);
  print('alarm parsed DateTime: $parsedDateTime');
  print('alarm parsed DateTime: hour=${parsedDateTime.hour}, minute=${parsedDateTime.minute}');
}
