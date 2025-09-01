import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to Edit Profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 Profile Header
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/img.png"), // Replace with networkImage
                  ),
                  const SizedBox(height: 10),
                  const Text("Harsh Singhal",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text("Delhi, India • Age: 24 • Male",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Stats Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _statItem("Rank", "#12"),
                    _statItem("Points", "340"),
                    _statItem("Matches", "45"),
                    _statItem("Wins", "28"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Sports Preferences
            const Text("Sports Preferences",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: const [
                Chip(label: Text("Cricket")),
                Chip(label: Text("Badminton")),
                Chip(label: Text("Chess")),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Injury Status
            Card(
              color: Colors.orange.shade50,
              child: ListTile(
                leading: const Icon(Icons.health_and_safety, color: Colors.orange),
                title: const Text("Injury Status"),
                subtitle: const Text("Currently Fit to Play"),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Update Injury Tag
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text("Update"),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Match History
            const Text("Recent Matches",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _matchHistory("Cricket", "vs Mumbai", "Won", "Aug 28, 2025"),
            _matchHistory("Badminton", "vs Rahul", "Lost", "Aug 22, 2025"),
            _matchHistory("Chess", "vs Aman", "Won", "Aug 18, 2025"),

            const SizedBox(height: 20),

            // 🔹 Package Info
            Card(
              color: Colors.deepPurple.shade50,
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.deepPurple),
                title: const Text("Match Package"),
                subtitle: const Text("2 matches left in current package"),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Navigate to Payment/Buy Package
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text("Buy More"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Stat Item
  Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  // 🔹 Reusable Match History Item
  Widget _matchHistory(String sport, String opponent, String result, String date) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.sports, color: Colors.deepPurple),
        title: Text("$sport $opponent"),
        subtitle: Text("Result: $result • $date"),
      ),
    );
  }
}
