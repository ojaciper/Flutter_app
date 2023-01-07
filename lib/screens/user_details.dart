import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_model.dart';

class UserDetails extends StatelessWidget {
  final UserModel user;
  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blueAccent,
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.network(
                user.avatar,
                fit: BoxFit.fitWidth,
                height: 250,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${user.firstName} ${user.lastName}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.email,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Like"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("share"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("comment"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: border,
                  focusedBorder: border,
                  hintText:
                      "${user.firstName} Send a message to your freinds...",
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 300,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFF42A5F5),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Send Message",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )
          ],
        ),
      )),
    );
  }
}
