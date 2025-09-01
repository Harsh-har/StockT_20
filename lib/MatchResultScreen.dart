import 'package:flutter/material.dart';

// 🟣 Match History Screen
class MatchHistoryScreen extends StatefulWidget {
  const MatchHistoryScreen({super.key});

  @override
  State<MatchHistoryScreen> createState() => _MatchHistoryScreenState();
}

class _MatchHistoryScreenState extends State<MatchHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy played matches
  final List<Map<String, dynamic>> playedMatches = [
    {
      "opponent": "Rahul Sharma",
      "sport": "Cricket",
      "result": "Won",
      "score": "250-240",
      "date": "28 Aug 2025"
    },
    {
      "opponent": "Aman Verma",
      "sport": "Badminton",
      "result": "Lost",
      "score": "18-21",
      "date": "22 Aug 2025"
    },
    {
      "opponent": "Ravi Kumar",
      "sport": "Chess",
      "result": "Won",
      "score": "1-0",
      "date": "18 Aug 2025"
    },
  ];

  // Dummy pending matches
  final List<Map<String, dynamic>> pendingMatches = [
    {"opponent": "Harsh Singhal", "sport": "Carrom", "status": "Pending"},
    {"opponent": "Vikas Yadav", "sport": "Cricket", "status": "Pending"},
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
        title: const Text("Match History"),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Played"),
            Tab(text: "Pending"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPlayedMatches(),
          _buildPendingMatches(),
        ],
      ),
    );
  }

  // 🔹 Played Matches
  Widget _buildPlayedMatches() {
    return ListView.builder(
      itemCount: playedMatches.length,
      itemBuilder: (context, index) {
        final match = playedMatches[index];
        final result = match["result"];
        final isWon = result == "Won";

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: isWon ? Colors.green.shade50 : Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: _sportIcon(match["sport"]),
            ),
            title: Text(
              "${match["sport"]} vs ${match["opponent"]}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              "Score: ${match["score"]} • Date: ${match["date"]}",
              style: const TextStyle(fontSize: 14),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isWon ? Colors.green.shade200 : Colors.red.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                result,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  // 🔹 Pending Matches
  Widget _buildPendingMatches() {
    return ListView.builder(
      itemCount: pendingMatches.length,
      itemBuilder: (context, index) {
        final match = pendingMatches[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Colors.orange.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          child: ListTile(
            leading:
            const Icon(Icons.access_time, color: Colors.deepOrange, size: 32),
            title: Text(
              "${match["sport"]} vs ${match["opponent"]}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: const Text("Result not submitted"),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MatchResultScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Enter Result"),
            ),
          ),
        );
      },
    );
  }

  // 🎾 Sport specific icon
  Widget _sportIcon(String sport) {
    switch (sport) {
      case "Cricket":
        return const Icon(Icons.sports_cricket, color: Colors.white);
      case "Badminton":
        return const Icon(Icons.sports_tennis, color: Colors.white);
      case "Chess":
        return const Icon(Icons.sports_esports, color: Colors.white);
      case "Carrom":
        return const Icon(Icons.sports, color: Colors.white);
      default:
        return const Icon(Icons.sports, color: Colors.white);
    }
  }
}

// 🟣 Match Result Entry Screen
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Card(
                color: Colors.deepPurple.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 20),
                child: const ListTile(
                  leading:
                  Icon(Icons.sports_cricket, color: Colors.deepPurple),
                  title: Text("Match Result Entry",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text("Fill details below to submit"),
                ),
              ),

              _buildTextField("Winner Name", (value) => winner = value!),
              const SizedBox(height: 16),
              _buildTextField("Loser Name", (value) => loser = value!),
              const SizedBox(height: 16),
              _buildTextField("Score (e.g. 21-15 / 250-240)",
                      (value) => score = value!),

              const SizedBox(height: 28),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Result submitted: $winner defeated $loser ($score)"),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "Submit Result",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Reusable styled TextField
  Widget _buildTextField(String label, Function(String?) onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) => value!.isEmpty ? "Please enter $label" : null,
      onChanged: onChanged,
    );
  }
}
