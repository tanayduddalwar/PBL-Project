import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeatBookingLayout extends StatelessWidget {
  final int randomSeats;

  SeatBookingLayout({required this.randomSeats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Vacancy Position'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10, // Number of columns in the grid
        ),
        itemCount: 100, // Total number of seats in the grid
        itemBuilder: (context, index) {
          // Determine if the seat should be locked or not based on the random number
          bool isLocked = index < randomSeats;

          return Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isLocked ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Seat ${index + 1}',
                style: TextStyle(
                  color: isLocked ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RandomNumberScreen extends StatefulWidget {
  @override
  _RandomNumberScreenState createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  Timer? _timer;
  int randomNum = 0;
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _initializeFlutterLocalNotifications();
    _initializeRandomNumber();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initializeFlutterLocalNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin!.initialize(initializationSettings);
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'random_number_channel',
      'Random Number Channel',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin!.show(
      0,
      'Random Number Update',
      'The random number has been updated.',
      platformChannelSpecifics,
    );
  }

  Future<void> _initializeRandomNumber() async {
    _prefs = await SharedPreferences.getInstance();
    final storedRandomNum = _prefs?.getInt('randomNum');
    final storedTimestamp = _prefs?.getInt('timestamp');

    if (storedRandomNum != null && storedTimestamp != null) {
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final elapsedTime = currentTime - storedTimestamp;

      if (elapsedTime < 2 * 60 * 1000) {
        // Random number is still valid within the 5-minute timeframe
        setState(() {
          randomNum = storedRandomNum;
        });
        return;
      }
    }

    _updateRandomNumber();
  }

  void _updateRandomNumber() {
    final newRandomNum =
        Random().nextInt(100) + 1; // Generates a random number between 1 and 10
    _prefs?.setInt('randomNum', newRandomNum);
    _prefs?.setInt('timestamp', DateTime.now().millisecondsSinceEpoch);

    setState(() {
      randomNum = newRandomNum;
    });

    _showNotification();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 2), (_) => _updateRandomNumber());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text(
          'Vacancy Position',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pict_library.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total number of seats in reading hall: 100\n",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.grey,
                    color: Colors.black),
              ),
              Text(
                'Number of occupied seats: $randomNum',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.grey,
                    color: Colors.black),
              ),
              SizedBox(height: 23),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SeatBookingLayout(randomSeats: randomNum),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent),
                  child: Text(
                    'Go to Seat Locking',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RandomNumberScreen(),
  ));
}
