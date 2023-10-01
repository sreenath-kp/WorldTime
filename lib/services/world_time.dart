import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:circle_flags/circle_flags.dart';

class WorldTime {
  String location;
  CircleFlag flag;
  String url;
  late bool isDaytime;
  late String time;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make request
      Response response = await get(Uri(
        scheme: 'https',
        host: 'worldtimeapi.org',
        path: 'api/timezone/$url',
      ));
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data
      String datetime = data['datetime'];
      String offsetHr = data['utc_offset'].substring(0, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);
      // print(data['utc_offset'].substring(0, 3));
      // print(offset_min);

      // Create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offsetHr), minutes: int.parse(offsetMin)));
      // Set time
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Failed to gather Time Data';
    }
  }
}
