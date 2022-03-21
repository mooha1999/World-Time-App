import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location, flag, url;
  late String time;
  late bool isDayTime = false;
  WorldTime( this.url, this.location, this.flag);

  Future<void> getTime() async {
    try {
      String authority = 'worldtimeapi.org';
      String unencodedPath = '/api/timezone/$url';

      Response response = await get(Uri.http(authority, unencodedPath));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now  = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = (now.hour>6 && now.hour<19);
      time = DateFormat.jm().format(now);
    } on Exception catch (e) {
      print('caught exception $e');
      time = 'Refresh the app';
    }
  }
}