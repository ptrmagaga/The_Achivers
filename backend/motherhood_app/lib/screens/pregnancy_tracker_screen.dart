import 'package:flutter/material.dart';
import '../data/pregnancy_weeks.dart';

class PregnancyTrackerScreen extends StatelessWidget {
  final int currentWeek = 20; // Later, this should come from the user profile

  @override
  Widget build(BuildContext context) {
    final weekData = pregnancyWeeks[currentWeek];

    return Scaffold(
      appBar: AppBar(title: Text("Pregnancy Tracker")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Week $currentWeek of 40", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Your Baby's Growth", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(weekData?['baby_growth'] ?? "Baby is growing!"), // Null-aware access

            SizedBox(height: 20),

            Text("Mother's Changes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(weekData?['mother_changes'] ?? "Expect some changes in your body."), // Null-aware access

            SizedBox(height: 20),

            Text("Health Tips", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(weekData?['health_tips'] ?? "Stay healthy and hydrated!"), // Null-aware access
          ],
        ),
      ),
    );
  }
}
