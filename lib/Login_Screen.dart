import 'package:flutter/material.dart';
import 'package:yaaara/Home_Screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'assets/bat_icon.png',
                  height: 100,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Sign in to your account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // phone number field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Phone Number',
                      hintText: '+91 9876543210',
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // password field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Password',
                      hintText: '******',
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forget Password?"),
                  ),
                ),

                const SizedBox(height: 15),

                // sign in button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5f9658),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: () {
                       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text("or sign in with"),
                const SizedBox(height: 15),

                // social icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _socialButton("assets/google.png"),
                    _socialButton("assets/facebook.png"),
                    _socialButton("assets/twitter.png"),
                  ],
                ),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xff29773D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String img) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Image.asset(img, height: 25),
      ),
    );
  }
}
