import 'package:flutter/material.dart';

import 'Toplosser_Screen.dart';



class TeamSelectionScreen extends StatefulWidget {
  const TeamSelectionScreen({Key? key}) : super(key: key);

  @override
  State<TeamSelectionScreen> createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
  List<Map<String, dynamic>> players = [
    {
      "name": "Rohit Sharma",
      "team": "Mumbai Mavericks",
      "credits": 950,
      "image": "assets/images/iconsplash.png",
      "isSelected": false
    },
    {
      "name": "Jasprit Bumrah",
      "team": "Mumbai Mavericks",
      "credits": 880,
      "image": "assets/images/googleicon.png",
      "isSelected": false
    },
    {
      "name": "Rashid Khan",
      "team": "Gujarat Titans",
      "credits": 870,
      "image": "https://via.placeholder.com/150",
      "isSelected": false
    },
    {
      "name": "Babar Azam",
      "team": "Peshawar Zalmi",
      "credits": 910,
      "image": "https://via.placeholder.com/150",
      "isSelected": false
    },
    {
      "name": "David Warner",
      "team": "Delhi Daredevils",
      "credits": 900,
      "image": "https://via.placeholder.com/150",
      "isSelected": false
    },
    {
      "name": "Steve Smith",
      "team": "Sydney Sixers",
      "credits": 895,
      "image": "https://via.placeholder.com/150",
      "isSelected": false
    },
    {
      "name": "Faf du Plessis",
      "team": "Royal Challengers Bangalore",
      "credits": 875,
      "image": "https://via.placeholder.com/150",
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
        leading: Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Team Selection",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Find Players...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff59975C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {},
                    child: const Text("Top Gainers",style: TextStyle(color: Colors.white),),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TopLoserTeamScreen(),));
                    },
                    child: const Text("Top Losers"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(player["image"]),
                      ),
                      title: Text(
                        player["name"],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            player["team"],
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${player["credits"]} Credits",
                            style: const TextStyle(
                                color: Color(0xff59975C),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
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
                            child: const Text(
                              "Gainer",
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
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
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
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
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff59975C),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {},
                child: const Text(
                  "Confirm Team",
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
