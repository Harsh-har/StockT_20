import 'package:flutter/material.dart';
import 'package:yaaara/ChallengesScreen.dart';
import 'package:yaaara/LeaderboardScreen.dart';
import 'package:yaaara/Profile_Screen.dart';
import 'CompetitonsScreen.dart';
import 'MatchResultScreen.dart';
import 'NotificationScreen.dart';
import 'PaytmScreen.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _selectedIndex = 0;

  // 🔹 Screens list for bottom nav
  final List<Widget> _screens = [
    const DashboardContent(),   // Home content
    const AddFundsScreen(),     // Wallet / Add Funds
    const CompetitionsScreen(), // Competitions
    const ProfileScreen(),      // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports Olymps"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Add Funds"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "Competitions"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

/// 🔹 Home Dashboard Content (moved out for clean structure)
class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Player Info Card
          Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              leading: const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage("assets/images/dpf.png"),
              ),
              title: const Text("Harsh Singhal",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Rank #12 • Points: 340"),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Quick Actions Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _dashboardButton(Icons.leaderboard, "Leaderboards", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaderboardScreen()));
              }),
              _dashboardButton(Icons.sports_kabaddi, "Challenges", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChallengesScreen()));
              }),
              _dashboardButton(Icons.history, "Match History", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MatchHistoryScreen()));
              }),
              _dashboardButton(Icons.emoji_events, "Competitions", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompetitionsScreen()));
              }),
            ],
          ),

          const SizedBox(height: 25),

          // 🔹 Live Matches Section
          const Text("Live Matches",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Card(
            color: Colors.deepPurple.shade50,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: const Icon(Icons.sports_cricket, color: Colors.deepPurple),
              title: const Text("Cricket: Delhi vs Mumbai"),
              subtitle: const Text("Live Now • Watch on YouTube"),
              trailing: ElevatedButton(
                onPressed: () {},
                style:
                ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text("Watch"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashboardButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.deepPurple),
              const SizedBox(height: 8),
              Text(label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 Dummy Add Funds Screen
class AddFundsScreen extends StatelessWidget {
  const AddFundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Add ₹500 to Wallet"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  PaytmScreen(),));
        },
      ),
    );
  }
}
