import 'dart:async';
import 'package:first_app/modules/Screens/home/widgets/salesView.dart';
import 'package:flutter/material.dart';

class FlashDealView extends StatefulWidget {
  const FlashDealView({super.key});

  @override
  State<FlashDealView> createState() => _FlashDealViewState();
}

class _FlashDealViewState extends State<FlashDealView> {
  late Timer _timer;
  Duration _duration =
      const Duration(hours: 84); // Starting countdown from 84 hours

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _duration -= const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int hours = _duration.inHours;
    final int minutes = _duration.inMinutes % 60;
    final int seconds = _duration.inSeconds % 60;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 6, 38, 94)),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8, left: 25),
              child: Text(
                'FlashDeal',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const Icon(
              Icons.bolt,
              color: Colors.amber,
              size: 35,
            ),
            Row12(
              txt: 'Hrs',
              data: hours.toString().padLeft(2, '0'),
            ),
            Row12(
              txt: 'Min',
              data: minutes.toString().padLeft(2, '0'),
            ),
            Row12(
              txt: 'Sec',
              data: seconds.toString().padLeft(2, '0'),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SalesView(),
                    ));
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Row12 extends StatelessWidget {
  const Row12({super.key, required this.txt, required this.data});
  final String txt;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Center(
              child: Text(
                data,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            txt,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
