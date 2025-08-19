import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture + Name
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/men/75.jpg"),
            ),
            const SizedBox(height: 8),
            const Text("UV Thakur",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("@uvthakur_t20",
                style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 16),

            // Balance
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Available Balance",
                      style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 6),
                  const Text("₹ 7350.55",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF59975C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text("Add Funds",style: TextStyle(color: Colors.white),),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.arrow_upward),
                        label: const Text("Withdraw"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Personal Information
            sectionTitle("Personal Information", true),
            infoRow(Icons.email, "Email", "UVthakur01@gmail.com"),
            infoRow(Icons.phone, "Mobile Number", "+91 98765 43210"),
            infoRow(Icons.account_balance, "Linked Bank Account",
                "Axis Bank, **** **1234"),
            Row(
              children: [
                const Icon(Icons.verified, size: 20, color: Colors.grey),
                const SizedBox(width: 10),
                const Text("KYC Status",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const Spacer(),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text("Verified",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            const SizedBox(height: 20),

            // Withdrawal Details
            sectionTitle("Withdrawal Details", false),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("State Bank of India, **** **** 5678"),
                  SizedBox(height: 6),
                  Text("Last withdrawal: Dec 20, 2023",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF59975C),
                minimumSize: const Size(double.infinity, 45),
              ),
              child: const Text("Request Withdrawal",style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),

            // Recent Transactions
            sectionTitle("Recent Transactions", false),
            transactionTile("Dec 28", "Cricket Premier League", "Contest Fee",
                "₹500.00", "Success"),
            transactionTile("Dec 27", "Stock T20 Deposit", "Deposit",
                "₹2500.00", "Success"),
            transactionTile("Dec 26", "Fantasy XI Tournament", "Winnings",
                "₹1200.00", "Success"),
            transactionTile("Dec 25", "Withdrawal Request", "Withdrawal",
                "₹1500.00", "Pending"),
            transactionTile("Dec 24", "Daily Challenge", "Contest Fee",
                "₹100.00", "Success"),

            const SizedBox(height: 20),
            const Text("Need help ?",
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline)),
          ],
        ),
      ),
    );
  }

  // Section Title
  Widget sectionTitle(String title, bool editable) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Spacer(),
        if (editable)
          const Icon(Icons.edit, size: 18, color: Colors.blue),
      ],
    );
  }

  // Info Row
  Widget infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }

  // Transaction Tile
  Widget transactionTile(String date, String title, String subtitle,
      String amount, String status) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(date,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == "Success"
                  ? Colors.orange
                  : status == "Pending"
                  ? Colors.red
                  : Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(status,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
    );
  }
}
