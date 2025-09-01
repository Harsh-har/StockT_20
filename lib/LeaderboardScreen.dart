import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedSport = "Cricket";

  final List<String> sports = ["Cricket", "Badminton", "Kabaddi", "Weightlifting"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboards"),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "City"),
            Tab(text: "State"),
            Tab(text: "National"),
          ],
        ),
      ),
      body: Column(
        children: [
          // 🔹 Sport Filter Dropdown
          Padding(
            padding: const EdgeInsets.all(12),
            child: DropdownButtonFormField<String>(
              value: selectedSport,
              items: sports.map((sport) {
                return DropdownMenuItem(
                  value: sport,
                  child: Text(sport),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSport = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Select Sport",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),

          // 🔹 Leaderboard Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLeaderboard("City"),
                _buildLeaderboard("State"),
                _buildLeaderboard("National"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Leaderboard Widget
  Widget _buildLeaderboard(String level) {
    List<Map<String, dynamic>> players;

    if (level == "City") {
      players = [
        {"rank": 1, "name": "Rahul Sharma", "points": 120, "matches": 10, "image": "assets/images/dpf.png"},
        {"rank": 2, "name": "Harsh Singhal", "points": 110, "matches": 9, "image": "assets/images/dpo.png"},
        {"rank": 3, "name": "Ravi Kumar", "points": 108, "matches": 8, "image": "assets/images/dpt.png"},
        {"rank": 4, "name": "Tushar Sharma", "points": 100, "matches": 9, "image": "assets/images/dpth.png"},
        {"rank": 5, "name": "Ansh", "points": 95, "matches": 8, "image": "assets/images/img_2.png"},
        {"rank": 6, "name": "Aman Rana", "points": 80, "matches": 9, "image": "assets/images/img.png"},
        {"rank": 7, "name": "Ramesh Datta", "points": 78, "matches": 8, "image": "assets/images/img_1.png"},
      ];
    } else if (level == "State") {
      players = [
        {"rank": 1, "name": "Aman Verma", "points": 300, "matches": 20, "image": "assets/images/dpt.png"},
        {"rank": 2, "name": "Rahul Sharma", "points": 280, "matches": 18, "image": "assets/images/dpo.png"},
        {"rank": 3, "name": "Harsh Singhal", "points": 250, "matches": 17, "image": "assets/images/img_2.png"},
        {"rank": 4, "name": "Ravi Kumar", "points": 240, "matches": 16, "image": "assets/user3.png"},
        {"rank": 5, "name": "Ansh", "points": 220, "matches": 15, "image": "assets/images/dpo.png"},
      ];
    } else {
      // National Leaderboard
      players = [
        {"rank": 1, "name": "Suresh Mehta", "points": 500, "matches": 35, "image": "assets/images/img_2.png"},
        {"rank": 2, "name": "Aman Verma", "points": 480, "matches": 32, "image": "assets/images/dpt.png"},
        {"rank": 3, "name": "Harsh Singhal", "points": 340, "matches": 25, "image": "assets/images/img_1.png"},
        {"rank": 4, "name": "Ravi Kumar", "points": 320, "matches": 22, "image": "assets/user3.png"},
        {"rank": 5, "name": "Tushar Sharma", "points": 300, "matches": 20, "image": "assets/images/dpo.png"},
        {"rank": 6, "name": "Ansh", "points": 280, "matches": 19, "image": "assets/user5.png"},
        {"rank": 7, "name": "Ramesh Datta", "points": 260, "matches": 18, "image": "assets/images/dpf.png"},
      ];
    }

    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        final isCurrentUser = player["name"] == "Harsh Singhal";

        return Card(
          color: isCurrentUser ? Colors.deepPurple.shade100 : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(player["image"]),
            ),
            title: Text(
              "${player["name"]}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.sports, size: 16, color: Colors.deepPurple),
                const SizedBox(width: 4),
                Text("Matches: ${player["matches"]}"),
              ],
            ),
            trailing: Text(
              "${player["points"]} pts",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
