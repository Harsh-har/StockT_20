import 'package:flutter/material.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text("Available Contest",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
        actions: const [
          Icon(Icons.settings, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                tabButton("Mega Contests", true),
                const SizedBox(width: 8),
                tabButton("Head-to-Head", false),
                const SizedBox(width: 8),
                tabButton("Custom", false),
              ],
            ),
          ),

          // Contest List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                contestCard(
                    title: "Daily Grand Mega Contest",
                    entry: "₹150",
                    prize: "₹500,000",
                    spots: "7,500 / 10,000 spots filled",
                    progress: 0.75,
                    time: "2h 30m"),
                contestCard(
                    title: "Head-to-Head Pro Showdown",
                    entry: "₹50",
                    prize: "₹1,000",
                    spots: "1 / 2 spots filled",
                    progress: 0.5,
                    time: "1h 30m"),
                contestCard(
                    title: "Beginner Friendly League",
                    entry: "₹80",
                    prize: "₹10,000",
                    spots: "250 / 500 spots filled",
                    progress: 0.5,
                    time: "3h 5m"),
                contestCard(
                    title: "Custom Group Challenge",
                    entry: "₹220",
                    prize: "₹25,000",
                    spots: "15 / 20 spots filled",
                    progress: 0.75,
                    time: "4h 45m"),
                contestCard(
                    title: "Weekend Warrior Pot",
                    entry: "₹75",
                    prize: "₹75,000",
                    spots: "1500 / 2000 spots filled",
                    progress: 0.75,
                    time: "1d 10h"),
                contestCard(
                    title: "Elite Stock Masters",
                    entry: "₹1000",
                    prize: "₹10,000,00",
                    spots: "100 / 200 spots filled",
                    progress: 0.5,
                    time: "2h 00m"),
                contestCard(
                    title: "The Mid-Week Marasthon",
                    entry: "₹250",
                    prize: "₹150,000",
                    spots: "3000 / 5000 spots filled",
                    progress: 0.6,
                    time: "5h 00m"),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Tab Button
  Widget tabButton(String text, bool selected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.green.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              color: selected ? Color(0xFF59975C) : Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // Contest Card
  Widget contestCard(
      {required String title,
        required String entry,
        required String prize,
        required String spots,
        required double progress,
        required String time}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(title,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          // Entry + Prize
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.link, size: 18, color: Color(0xFF59975C)),
                  const SizedBox(width: 5),
                  Text("Entry: $entry",
                      style: const TextStyle(color: Colors.black87)),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.emoji_events,
                      size: 18, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text(prize,
                      style: const TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Progress
          LinearProgressIndicator(
            value: progress,
            color: Color(0xFF59975C),
            backgroundColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 6),
          Text(spots, style: const TextStyle(color: Colors.black54)),

          const SizedBox(height: 10),

          // Time + Join Button
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const SizedBox(width: 5),
              Text("Ends in $time",
                  style: const TextStyle(color: Colors.black54)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF59975C),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                child: const Text("Join Now",style: TextStyle(color: Colors.white),),
              )
            ],
          )
        ],
      ),
    );
  }
}
