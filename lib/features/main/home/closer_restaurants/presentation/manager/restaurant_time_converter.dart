/// Converts a 12-hour time format string to a 24-hour time format string.
///
/// This function takes a time string in 12-hour format (e.g., "02:30 PM") and
/// converts it to a 24-hour format (e.g., "14:30").
///
/// @param time The time string in 12-hour format.
/// @returns The time string in 24-hour format.
///
/// Example:
/// ```dart
/// String time24 = convertTo24Hour("02:30 PM"); // returns "14:30"
/// ```
String convertTo24Hour(String time) {
  time = time.trim();

  bool isPM = time.toLowerCase().contains('pm');
  bool isAM = time.toLowerCase().contains('am');

  time = time.replaceAll(RegExp(r'[APap][Mm]'), '').trim();

  List<String> parts = time.split(':');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);

  if (isPM && hours != 12) {
    hours += 12;
  } else if (isAM && hours == 12) {
    hours = 0;
  }

  String hoursStr = hours.toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');

  return '$hoursStr:$minutesStr';
}

/// Compares the current time with a given time range in 24-hour format.
///
/// This function checks if the current time falls within the specified start
/// and end times. The end time can be midnight (00:00) of the next day.
///
/// @param startTime24 The start time in 24-hour format.
/// @param endTime24 The end time in 24-hour format.
/// @returns `true` if the current time is within the range, `false` otherwise.
///
/// Example:
/// ```dart
/// bool isWithinRange = compareWithCurrentTime("14:00", "18:00"); // returns true or false
/// ```
bool compareWithCurrentTime(String startTime24, String endTime24) {
  DateTime now = DateTime.now();
  DateTime startTime = DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(startTime24.split(':')[0]),
    int.parse(startTime24.split(':')[1]),
  );

  DateTime endTime = DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(endTime24.split(':')[0]),
    int.parse(endTime24.split(':')[1]),
  );
  if (endTime.hour == 0 && endTime.minute == 0) {
    endTime = endTime.add(const Duration(days: 1));
  }

  return now.isAfter(startTime) && now.isBefore(endTime);
}

/// Checks if a restaurant is currently opened based on its operating hours.
///
/// This function takes a time string representing the restaurant's operating
/// hours (e.g., "10:00 AM - 10:00 PM") and determines if the restaurant is
/// currently opened.
///
/// @param timeString The operating hours of the restaurant in 12-hour format.
/// @returns `true` if the restaurant is currently opened, `false` otherwise.
///
/// Example:
/// ```dart
/// bool isOpened = isRestaurantOpened("10:00 AM - 10:00 PM"); // returns true or false
/// ```
bool isRestaurantOpened(String timeString) {
  List<String> times = timeString.split(' - ');

  String startTime24 = convertTo24Hour(times[0]);
  String endTime24 = convertTo24Hour(times[1]);
  bool isOpened = compareWithCurrentTime(startTime24, endTime24);
  return isOpened;
}
