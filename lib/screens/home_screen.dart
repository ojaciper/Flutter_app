import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_services.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/widget/custom_list_tile.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> userList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

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
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: userList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    var data = userList[index];
                    return (CustomListTile(user: data));
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
