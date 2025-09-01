import 'package:flutter/material.dart';

class CompetitionsScreen extends StatefulWidget {
  const CompetitionsScreen({super.key});

  @override
  State<CompetitionsScreen> createState() => _CompetitionsScreenState();
}

class _CompetitionsScreenState extends State<CompetitionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> upcomingCompetitions = [
    {
      "name": "Delhi Cricket Cup",
      "sport": "Cricket",
      "date": "10 Sep 2025",
      "location": "Delhi Stadium"
    },
    {
      "name": "State Badminton Open",
      "sport": "Badminton",
      "date": "15 Sep 2025",
      "location": "Lucknow Arena"
    },
  ];

  final List<Map<String, dynamic>> ongoingCompetitions = [
    {
      "name": "National Chess Championship",
      "sport": "Chess",
      "date": "01-10 Sep 2025",
      "location": "Mumbai",
    },
  ];

  final List<Map<String, dynamic>> completedCompetitions = [
    {
      "name": "City Carrom League",
      "sport": "Carrom",
      "winner": "Harsh Singhal",
      "date": "20 Aug 2025"
    },
    {
      "name": "Weightlifting Challenge",
      "sport": "Weightlifting",
      "winner": "Ravi Kumar",
      "date": "18 Aug 2025"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Competitions"),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Upcoming"),
            Tab(text: "Ongoing"),
            Tab(text: "Completed"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpcoming(),
          _buildOngoing(),
          _buildCompleted(),
        ],
      ),
    );
  }

  // 🔹 Upcoming Competitions
  Widget _buildUpcoming() {
    return ListView.builder(
      itemCount: upcomingCompetitions.length,
      itemBuilder: (context, index) {
        final comp = upcomingCompetitions[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          child: ListTile(
            leading: const Icon(Icons.event, color: Colors.deepPurple),
            title: Text(comp["name"],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${comp["sport"]} • ${comp["date"]}\n${comp["location"]}"),
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Registered for ${comp["name"]}")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Register"),
            ),
          ),
        );
      },
    );
  }

  // 🔹 Ongoing Competitions
  Widget _buildOngoing() {
    return ListView.builder(
      itemCount: ongoingCompetitions.length,
      itemBuilder: (context, index) {
        final comp = ongoingCompetitions[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          color: Colors.deepPurple.shade50,
          child: ListTile(
            leading: const Icon(Icons.sports, color: Colors.deepPurple),
            title: Text(comp["name"],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${comp["sport"]} • ${comp["date"]}\n${comp["location"]}"),
            trailing: const Text(
              "Live",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  // 🔹 Completed Competitions
  Widget _buildCompleted() {
    return ListView.builder(
      itemCount: completedCompetitions.length,
      itemBuilder: (context, index) {
        final comp = completedCompetitions[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          color: Colors.grey.shade100,
          child: ListTile(
            leading: const Icon(Icons.emoji_events, color: Colors.amber),
            title: Text(comp["name"],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${comp["sport"]} • ${comp["date"]}"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Winner",
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                Text(comp["winner"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              ],
            ),
          ),
        );
      },
    );
  }
}
