class DateTimeModel {
  final String month;
  final String day;
  final String hour;
  final String minute;
  final String period;

  DateTimeModel({
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.period,
  });

  String getFormattedDateTime() {
    return '$month $day, $hour:$minute $period';
  }

  String getDisplayText() {
    final now = DateTime.now();
    final selectedMonth = _getMonthNumber(month);
    final selectedDay = int.parse(day.replaceAll(RegExp(r'[^0-9]'), ''));

    String dayPrefix = 'today';
    if (selectedMonth == now.month && selectedDay == now.day) {
      dayPrefix = 'today';
    } else if (selectedMonth == now.month && selectedDay == now.day + 1) {
      dayPrefix = 'tomorrow';
    } else {
      dayPrefix = '$month $day';
    }

    return '$dayPrefix $hour:$minute $period - ${_getEndTime()}';
  }

  String _getEndTime() {
    int h = int.parse(hour);
    int m = int.parse(minute);
    String p = period;

    m += 15;
    if (m >= 60) {
      m -= 60;
      h += 1;
      if (h > 12) {
        h = 1;
      }
      if (h == 12) {
        p = p == 'am' ? 'pm' : 'am';
      }
    }

    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')} $p';
  }

  int _getMonthNumber(String month) {
    switch (month.toLowerCase()) {
      case 'oct.':
        return 10;
      case 'nov.':
        return 11;
      case 'dec.':
        return 12;
      case 'jan.':
        return 1;
      default:
        return DateTime.now().month;
    }
  }

  DateTime toDateTime() {
    final now = DateTime.now();
    final monthNum = _getMonthNumber(month);
    final dayNum = int.parse(day.replaceAll(RegExp(r'[^0-9]'), ''));
    var hourNum = int.parse(hour);
    final minuteNum = int.parse(minute);

    if (period.toLowerCase() == 'pm' && hourNum != 12) {
      hourNum += 12;
    } else if (period.toLowerCase() == 'am' && hourNum == 12) {
      hourNum = 0;
    }

    return DateTime(now.year, monthNum, dayNum, hourNum, minuteNum);
  }
}
