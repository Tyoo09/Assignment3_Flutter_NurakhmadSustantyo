import 'package:assignment3_flutter/models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_providers.dart';
import '../widgets/user_widgets.dart';

class UserOverviewScreen extends StatelessWidget {
  const UserOverviewScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context).getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            List<UserModels> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return UserCard(
                  id: user.id!,
                  name: user.name!,
                  username: user.username!,
                  email: user.email!,
                  address: user.address!,
                  phone: user.phone!,
                  website: user.website!,
                  company: user.company!,
                );
              },
            );
          }
        },
      ),
    );
  }
}
