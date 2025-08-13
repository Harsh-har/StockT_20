import 'package:flutter/material.dart';

import 'Matchresult_Screen.dart';
import 'Topgainer_Screen.dart';


class TopLoserTeamScreen extends StatefulWidget {
  const TopLoserTeamScreen({Key? key}) : super(key: key);

  @override
  State<TopLoserTeamScreen> createState() => _TopLoserTeamScreenState();
}

class _TopLoserTeamScreenState extends State<TopLoserTeamScreen> {
  List<Map<String, dynamic>> players = [
    {
      "name": "Virat Kohli",
      "team": "RCB",
      "credits": 9.5,
      "image": "assets/images/virat.png",
      "isSelected": false
    },
    {
      "name": "Rohit Sharma",
      "team": "MI",
      "credits": 9.0,
      "image": "assets/images/rohit.png",
      "isSelected": false
    },
    {
      "name": "Jasprit Bumrah",
      "team": "MI",
      "credits": 8.8,
      "image": "assets/images/bumrah.png",
      "isSelected": false
    },
    {
      "name": "MS Dhoni",
      "team": "CSK",
      "credits": 8.5,
      "image": "assets/images/dhoni.png",
      "isSelected": false
    },
    {
      "name": "Hardik Pandya",
      "team": "GT",
      "credits": 8.7,
      "image": "assets/images/hardik.png",
      "isSelected": false
    },
    {
      "name": "Rishabh Pant",
      "team": "DC",
      "credits": 8.6,
      "image": "assets/images/pant.png",
      "isSelected": false
    },
    {
      "name": "Shubman Gill",
      "team": "GT",
      "credits": 8.9,
      "image": "assets/images/gill.png",
      "isSelected": false
    },
    {
      "name": "Ravindra Jadeja",
      "team": "CSK",
      "credits": 8.4,
      "image": "assets/images/jadeja.png",
      "isSelected": false
    },
    {
      "name": "Mohammed Shami",
      "team": "GT",
      "credits": 8.3,
      "image": "assets/images/shami.png",
      "isSelected": false
    },
    {
      "name": "KL Rahul",
      "team": "LSG",
      "credits": 8.2,
      "image": "assets/images/rahul.png",
      "isSelected": false
    },
    {
      "name": "Trent Boult",
      "team": "RR",
      "credits": 8.1,
      "image": "assets/images/boult.png",
      "isSelected": false
    },
    {
      "name": "David Warner",
      "team": "DC",
      "credits": 8.0,
      "image": "assets/images/warner.png",
      "isSelected": false
    },
    {
      "name": "Sanju Samson",
      "team": "RR",
      "credits": 7.9,
      "image": "assets/images/samson.png",
      "isSelected": false
    },
    {
      "name": "Bhuvneshwar Kumar",
      "team": "SRH",
      "credits": 7.8,
      "image": "assets/images/bhuvi.png",
      "isSelected": false
    },
    {
      "name": "Faf du Plessis",
      "team": "RCB",
      "credits": 7.7,
      "image": "assets/images/faf.png",
      "isSelected": false
    },
  ];

  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Top Loser Team",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Find Players...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 12),

            // Toggle buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeamSelectionScreen(),));
                    },
                    child: const Text("Top Gainers"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff59975C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {},
                    child: const Text("Top Losers",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Players List
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  var player = players[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage(player["image"]),
                      ),
                      title: Text(
                        player["name"],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(Icons.sports_cricket,
                              size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            player["team"],
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "${player["credits"]} Credits",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Checkbox(
                            value: player["isSelected"],
                            onChanged: (value) {
                              setState(() {
                                player["isSelected"] = value!;
                                selectedCount = players
                                    .where((p) => p["isSelected"] == true)
                                    .length;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Selected count
            Row(
              children: [
                const Text(
                  "Selected: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text("$selectedCount/11"),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff59975C),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MatchResultsScreen(),));
                },
                child: const Text(
                  "Submit Team",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
