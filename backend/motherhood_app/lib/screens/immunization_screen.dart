import 'package:flutter/material.dart';

class ImmunizationScreen extends StatelessWidget {
  final List<Map<String, String>> immunizationSchedule = [
    {"age": "At birth", "vaccine": "BCG, Hepatitis B"},
    {"age": "6 weeks", "vaccine": "DTP, Polio, Rotavirus"},
    {"age": "10 weeks", "vaccine": "DTP, Polio, Rotavirus"},
    {"age": "14 weeks", "vaccine": "DTP, Polio, Hib"},
    {"age": "9 months", "vaccine": "Measles, Yellow Fever"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Immunization Schedule")),
      body: ListView.builder(
        itemCount: immunizationSchedule.length,
        itemBuilder: (context, index) {
          final item = immunizationSchedule[index];
          return ListTile(
            title: Text(item["age"] ?? ""),
            subtitle: Text("Vaccine: ${item["vaccine"]}"),
            trailing: Icon(Icons.check_circle_outline, color: Colors.green),
          );
        },
      ),
    );
  }
}
