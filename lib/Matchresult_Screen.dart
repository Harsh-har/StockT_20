import 'package:flutter/material.dart';



class MatchResultsScreen extends StatelessWidget {
  const MatchResultsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> picks = const [
    {"name": "Virat Kohli", "role": "Batsman", "points": 120, "success": true, "icon": Icons.grass},
    {"name": "Rohit Sharma", "role": "Batsman", "points": 85, "success": true, "icon": Icons.sports_cricket},
    {"name": "Jasprit Bumrah", "role": "Bowler", "points": 45, "success": true, "icon": Icons.sports_cricket},
    {"name": "Hardik Pandya", "role": "All-rounder", "points": 70, "success": true, "icon": Icons.sports_handball},
    {"name": "MS Dhoni", "role": "Wicketkeeper", "points": 30, "success": false, "icon": Icons.sports_baseball},
    {"name": "Ravindra Jadeja", "role": "All-rounder", "points": 60, "success": true, "icon": Icons.sports_handball},
    {"name": "Shubman Gill", "role": "Batsman", "points": 15, "success": false, "icon": Icons.sports_cricket},
    {"name": "Mohammed Shami", "role": "Bowler", "points": 25, "success": true, "icon": Icons.sports_cricket},
    {"name": "KL Rahul", "role": "Wicketkeeper Batsman", "points": 40, "success": false, "icon": Icons.sports_baseball},
    {"name": "Kuldeep Yadav", "role": "Bowler", "points": 35, "success": true, "icon": Icons.sports_cricket},
    {"name": "Suryakumar Yadav", "role": "Batsman", "points": 90, "success": true, "icon": Icons.sports_cricket},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text("Match Results",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 12),
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Score Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/balloon.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 120,
                  ),
                  const SizedBox(height: 15),
                  const Text("Your Final Contest Score",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  const Text("875",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color:  Color(0xff59975C))),
                  const Text("Qualified! Rank #123",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  const Text(
                    "Points calculated based on performance.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff59975C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {},
                    child: const Text("View Leaderboard",style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Score Breakdown
            const Text("Score Breakdown",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            buildBreakdownRow("Average Return %", "+15.2 points", true),
            buildBreakdownRow("Sequence Bonus", "+50 points", true),
            buildBreakdownRow("Penalty", "-20 points", false),
            const SizedBox(height: 16),

            // Your Picks
            const Text("Your Picks",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...picks.map((p) => buildPlayerCard(p)).toList(),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events), label: "Contest"),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: "Leaderboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget buildBreakdownRow(String title, String points, bool positive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.black)),
          Text(
            points,
            style: TextStyle(
                color: positive ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget buildPlayerCard(Map<String, dynamic> p) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
            color: p["success"] ? Colors.grey[300]! : Colors.red),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Icon(p["icon"], size: 32, color: Colors.orange),
        title: Text(p["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(p["role"], style: const TextStyle(color: Colors.grey)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${p["points"]} pts",
                style: const TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(width: 8),
            Icon(
              p["success"] ? Icons.check_circle : Icons.cancel,
              color: p["success"] ? Colors.green : Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
