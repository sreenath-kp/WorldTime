import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:circle_flags/circle_flags.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: CircleFlag(
          'gb',
          size: 36,
        )),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Berlin',
        flag: CircleFlag(
          'de',
          size: 36,
        )),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: CircleFlag(
          'eg',
          size: 36,
        )),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: CircleFlag(
          'ke',
          size: 36,
        )),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: CircleFlag(
          'us',
          size: 36,
        )),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: CircleFlag(
          'us',
          size: 36,
        )),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: CircleFlag(
          'kr',
          size: 36,
        )),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: CircleFlag(
          'id',
          size: 36,
        )),
    WorldTime(
        url: 'Asia/Kolkata',
        location: 'Kolkata',
        flag: CircleFlag(
          'in',
          size: 36,
        )),
    WorldTime(
        url: 'Asia/Tokyo',
        location: 'Tokyo',
        flag: CircleFlag(
          'jp',
          size: 36,
        )),
  ];

  void updateTime(WorldTime wt) {
    // Navigate to home
    Navigator.pop(context, {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDaytime': wt.isDaytime,
    });
  }

  void getTime(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    updateTime(wt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  getTime(index);
                },
                title: Text(locations[index].location),
                leading: locations[index].flag,
              ),
            ),
          );
        },
      ),
    );
  }
}
