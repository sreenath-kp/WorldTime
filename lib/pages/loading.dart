// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:circle_flags/circle_flags.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpworldTime() async {
    WorldTime wt =
        WorldTime(location: 'Kolkata', flag: CircleFlag('in'), url: 'Asia/Kolkata');
    await wt.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDaytime':wt.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpworldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
