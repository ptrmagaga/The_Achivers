import 'package:flutter/material.dart';
import '../widgets/reminder_card.dart';
import '../widgets/quick_action_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Sarah! 👋", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Here are your important updates for the week:", style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),

            // Weekly Reminders
            Text("Weekly Reminders", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ReminderCard(
              title: "Clinic Visit",
              description: "Your next check-up is scheduled for March 10th.",
            ),
            ReminderCard(
              title: "Nutrition Tip",
              description: "Eat more iron-rich foods like spinach and beans.",
            ),
            ReminderCard(
              title: "Pregnancy Update",
              description: "You are in week 20! Expect some baby movements soon.",
            ),

            SizedBox(height: 20),

            // Quick Actions
            Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                QuickActionButton(icon: Icons.pregnant_woman, label: "Track Pregnancy", route: "/tracker"),
                QuickActionButton(icon: Icons.chat, label: "Find a Friend", route: "/community"),
                QuickActionButton(icon: Icons.health_and_safety, label: "Health Tips", route: "/health"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
