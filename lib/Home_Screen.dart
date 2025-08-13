import 'package:flutter/material.dart';

import 'Topgainer_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        title: const Text(
          "Stock T20",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Your Balance",
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                  const SizedBox(height: 8),
                  const Text(
                    "₹ 5,250.75",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 12),
                          child: Text("+ Join Contest"),
                        ),
                      ),
                      TextButton(
                        onPressed: ()
                        {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeamSelectionScreen(),));
                        },
                        child: const Text("+ Add Funds",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text("Active Contests",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  contestCard("IND vs AUS", "Live", "T20 World Cup Final", "₹ 50", "25k"),
                  const SizedBox(width: 10),
                  contestCard("MI vs CSK", "Upcoming", "IPL Clash - Final Showdown", "₹ 70", "43k"),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text("My Teams",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            teamTile("Check Warriors", 11, "Active"),
            teamTile("Pitch Predators", 10, "Drafting"),
            teamTile("Super Strikers", 11, "Active"),
            teamTile("Boundary Blazers", 9, "Pending"),

            const SizedBox(height: 30),
            const Text("Live Leaderboard",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            leaderboardTile(1, "Harsh Singhal", "1,200"),
            leaderboardTile(2, "Abhishek Pundir", "1,300"),
            leaderboardTile(3, "Kamal Sharma", "1,110"),
            leaderboardTile(4, "Gautam Kumar", "1,120"),
            leaderboardTile(5, "Arpit Kamboj", "1,270"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
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

  Widget contestCard(String title, String status, String desc, String fee, String players) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(fee, style: const TextStyle(color: Colors.black)),
              Text("$players 🏆", style: const TextStyle(color: Colors.orange)),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Join Now"),
          )
        ],
      ),
    );
  }

  Widget teamTile(String teamName, int players, String status) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xffE9FBE5),
          child: Icon(Icons.groups, color: Color(0xff84C784)),
        ),
        title: Text(teamName),
        subtitle: Text("$players Players"),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(status, style: const TextStyle(fontSize: 12)),
        ),
      ),
    );
  }

  Widget leaderboardTile(int rank, String name, String points) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(rank.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      title: Text(name),
      trailing: Text("$points 🏆",
          style:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
    );
  }
}
