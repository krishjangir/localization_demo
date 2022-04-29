import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTimeUtil._();

//getDateTime in 15 Jan 2022 at 02:20 PM' format
  static String getDateTimeInMonthDayFormat(String dateTime) {
    String getTime(DateTime dateTime) {
      return DateFormat('hh:mm a').format(dateTime).toUpperCase();
    }

    DateTime dateT = DateTime.parse(dateTime);
    return "${dateT.day} ${getMonthFromMonthNumber(dateT.month)} ${dateT.year} at ${getTime(dateT)}";
  }

//get month name from month number
  static String getMonthFromMonthNumber(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Jan";
    }
  }
}
