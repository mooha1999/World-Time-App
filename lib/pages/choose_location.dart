import 'package:flutter/material.dart';

import '../Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('Europe/London', 'London', 'uk.png'),
    WorldTime('Europe/Berlin', 'Athens', 'greece.png'),
    WorldTime('Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'kenya.png'),
    WorldTime('America/Chicago', 'Chicago', 'usa.png'),
    WorldTime('America/New_York', 'New York', 'usa.png'),
    WorldTime('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'indonesia.png'),
  ];

  void getTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () => getTime(index),
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
