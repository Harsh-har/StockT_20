import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int selectedTab = 0; // 0 = This Contest, 1 = All Contests

  final List<Map<String, dynamic>> players = [
    {"rank": 1, "name": "Liam Carter", "points": 1234, "image": "https://randomuser.me/api/portraits/men/32.jpg"},
    {"rank": 2, "name": "Noah Bennett", "points": 1220, "image": "https://randomuser.me/api/portraits/men/18.jpg"},
    {"rank": 3, "name": "Ethan Harper", "points": 1215, "image": "https://randomuser.me/api/portraits/men/75.jpg"},
    {"rank": 4, "name": "Lucas Foster", "points": 1200, "image": "https://randomuser.me/api/portraits/men/62.jpg"},
    {"rank": 5, "name": "Oliver Hayes", "points": 1190, "image": "https://randomuser.me/api/portraits/men/12.jpg"},
    {"rank": 6, "name": "Elijah Reed", "points": 1180, "image": "https://randomuser.me/api/portraits/men/82.jpg"},
    {"rank": 7, "name": "Grayson Cole", "points": 1170, "image": "https://randomuser.me/api/portraits/men/21.jpg"},
    {"rank": 8, "name": "Caleb Ford", "points": 1160, "image": "https://randomuser.me/api/portraits/men/50.jpg"},
    {"rank": 9, "name": "Owen West", "points": 1150, "image": "https://randomuser.me/api/portraits/men/95.jpg"},
    {"rank": 10, "name": "Henry Shaw", "points": 1140, "image": "https://randomuser.me/api/portraits/men/36.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Leaderboard",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for user",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedTab = 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedTab == 0 ? Colors.black : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    "This Contest",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedTab == 0 ? Colors.black : Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => setState(() => selectedTab = 1),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedTab == 1 ? Colors.black : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    "All Contests",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedTab == 1 ? Colors.black : Colors.grey),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Leaderboard List
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(player["image"]),
                    radius: 24,
                  ),
                  title: Text(player["name"],
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text("${player["points"]} points",
                      style: const TextStyle(color: Colors.blue)),
                  trailing: player["rank"] <= 3
                      ? const Icon(Icons.emoji_events, color: Colors.black)
                      : Text("${player["rank"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
