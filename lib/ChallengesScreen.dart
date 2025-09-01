import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String searchQuery = "";

  // Dummy players data
  final List<Map<String, dynamic>> players = [
    {"name": "Rahul Sharma", "sport": "Cricket", "city": "Delhi"},
    {"name": "Aman Verma", "sport": "Badminton", "city": "Mumbai"},
    {"name": "Harsh Singhal", "sport": "Chess", "city": "Delhi"},
    {"name": "Ravi Kumar", "sport": "Carrom", "city": "Chennai"},
  ];

  // Dummy challenges
  final List<Map<String, dynamic>> incomingChallenges = [
    {"name": "Ravi Kumar", "sport": "Cricket", "status": "Incoming"},
    {"name": "Aman Verma", "sport": "Chess", "status": "Incoming"},
  ];

  final List<Map<String, dynamic>> outgoingChallenges = [
    {"name": "Rahul Sharma", "sport": "Badminton", "status": "Pending"},
    {"name": "Harsh Singhal", "sport": "Carrom", "status": "Accepted"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenges"),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Find Players"),
            Tab(text: "Requests"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFindPlayers(),
          _buildRequests(),
        ],
      ),
    );
  }

  // 🔹 Find Players Tab
  Widget _buildFindPlayers() {
    final filteredPlayers = players
        .where((player) =>
    player["name"].toLowerCase().contains(searchQuery.toLowerCase()) ||
        player["sport"].toLowerCase().contains(searchQuery.toLowerCase()) ||
        player["city"].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search players by name, city or sport",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredPlayers.length,
            itemBuilder: (context, index) {
              final player = filteredPlayers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(player["name"]),
                  subtitle: Text("${player["sport"]} • ${player["city"]}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text("Challenge sent to ${player["name"]}")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                    child: const Text("Challenge"),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 🔹 Requests Tab
  Widget _buildRequests() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Text("Incoming Challenges",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...incomingChallenges.map((challenge) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.sports, color: Colors.deepPurple),
              title: Text(challenge["name"]),
              subtitle: Text(challenge["sport"]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Accepted challenge from ${challenge["name"]}")),
                        );
                      }),
                  IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Rejected challenge from ${challenge["name"]}")),
                        );
                      }),
                ],
              ),
            ),
          );
        }),

        const SizedBox(height: 20),
        const Text("Outgoing Challenges",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...outgoingChallenges.map((challenge) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.send, color: Colors.orange),
              title: Text(challenge["name"]),
              subtitle: Text(challenge["sport"]),
              trailing: challenge["status"] == "Accepted"
                  ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const MatchResultScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white),
                child: const Text("Enter Result"),
              )
                  : Text(challenge["status"],
                  style: TextStyle(
                      color: challenge["status"] == "Pending"
                          ? Colors.grey
                          : Colors.green)),
            ),
          );
        }),
      ],
    );
  }
}

// 🔹 Match Result Entry Screen
class MatchResultScreen extends StatefulWidget {
  const MatchResultScreen({super.key});

  @override
  State<MatchResultScreen> createState() => _MatchResultScreenState();
}

class _MatchResultScreenState extends State<MatchResultScreen> {
  final _formKey = GlobalKey<FormState>();
  String winner = "";
  String loser = "";
  String score = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Submit Match Result"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Winner Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => winner = value,
                validator: (value) =>
                value!.isEmpty ? "Please enter winner name" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Loser Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => loser = value,
                validator: (value) =>
                value!.isEmpty ? "Please enter loser name" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Score (e.g. 21-15 / 250-240)",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => score = value,
                validator: (value) =>
                value!.isEmpty ? "Please enter score" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Result submitted: $winner defeated $loser ($score)")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Submit Result"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
