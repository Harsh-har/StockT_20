import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "title": "New Challenge",
        "message": "Rahul Sharma challenged you for a Cricket match!",
        "time": "2 min ago",
        "icon": Icons.sports_cricket,
        "color": Colors.deepPurple,
      },
      {
        "title": "Competition Update",
        "message": "You are registered for Delhi Cricket Cup (10 Sep 2025).",
        "time": "1 hr ago",
        "icon": Icons.emoji_events,
        "color": Colors.orange,
      },
      {
        "title": "Match Result",
        "message": "You defeated Aman Verma in Badminton (21-18).",
        "time": "Yesterday",
        "icon": Icons.check_circle,
        "color": Colors.green,
      },
      {
        "title": "Leaderboard Update",
        "message": "Your rank improved to #12 in Cricket Leaderboard!",
        "time": "2 days ago",
        "icon": Icons.leaderboard,
        "color": Colors.blue,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: notif["color"].withOpacity(0.2),
                child: Icon(notif["icon"], color: notif["color"]),
              ),
              title: Text(
                notif["title"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(notif["message"]),
              trailing: Text(
                notif["time"],
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              onTap: () {
                // 👉 Future: Navigate to related screen (match, competition etc.)
              },
            ),
          );
        },
      ),
    );
  }
}
