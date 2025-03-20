import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'home_screen.dart';
import 'pregnancy_tracker_screen.dart';
import 'community_screen.dart';
import 'health_insights_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    PregnancyTrackerScreen(),
    CommunityScreen(),
    HealthInsightsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pregnant_woman), label: 'Tracker'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: 'Health'),
        ],
      ),
    );
  }
}

// Health Dashboard Content
class HealthDashboard extends StatelessWidget {
  final int currentWeek = 28; // Example: 28 weeks pregnant
  final String dueDate = "June 15, 2025";
  final double userWeight = 70.5; // User's weight in kg
  final double babyWeight = 1.2; // Baby's estimated weight in kg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pregnancy Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Week $currentWeek of 40 • Due Date: $dueDate"),
            SizedBox(height: 20),

            // Pregnancy Progress Bar
            LinearProgressIndicator(value: currentWeek / 40, minHeight: 10, backgroundColor: Colors.grey[300]),

            SizedBox(height: 20),

            Text("Health Stats", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HealthStatCard(label: "Your Weight", value: "$userWeight kg"),
                HealthStatCard(label: "Baby's Weight", value: "$babyWeight kg"),
              ],
            ),

            SizedBox(height: 20),

            Text("Baby Growth Chart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(child: BabyGrowthChart()),

            SizedBox(height: 20),

            Text("Daily Tip", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Stay hydrated! Drink at least 8 glasses of water per day."),
          ],
        ),
      ),
    );
  }
}

class HealthStatCard extends StatelessWidget {
  final String label;
  final String value;

  HealthStatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(value, style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
          ],
        ),
      ),
    );
  }
}

class BabyGrowthChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 0.5),
              FlSpot(2, 0.8),
              FlSpot(3, 1.1),
              FlSpot(4, 1.5),
              FlSpot(5, 2.0),
            ],
            isCurved: true,
            gradient: LinearGradient( // ✅ Use `gradient` instead of `colors`
              colors: [Colors.blue, Colors.lightBlue],
            ),            
            barWidth: 4,
            belowBarData: BarAreaData(show: true,
            gradient: LinearGradient(
              colors: [Colors.blue.withOpacity(0.3), Colors.lightBlue.withOpacity(0.3)],
             ),
          ),
          ),
        ],
      ),
    );
  }
}
