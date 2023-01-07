import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_services.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/screens/user_details.dart';
import 'package:flutter_app/widget/custom_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // a list of user from the api
  List<UserModel> userList = [];
  @override
  void initState() {
    super.initState();

    getuser();
  }

// function that fetch the api method form ApiService class
  getuser() async {
    userList = await ApiServices().getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.dehaze),
        title: const Text("Flutter App"),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: userList.isNotEmpty
            // show content when the userlist is not empty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    var data = userList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetails(user: data),
                          ),
                        );
                      },
                      child: CustomListTile(user: data),
                    );
                  },
                ),
              )
            // circular indicator when the lisst is empty
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
