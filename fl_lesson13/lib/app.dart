import 'package:flutter/material.dart';
import 'package:neoflex_app/user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final birthday = DateTime.now();

    const UserModel user1 = UserModel(
      login: 'user',
      firstName: 'firstName',
      lastName: 'lastName',
      department: 'ABD',
    );

    const user2 = UserModel(
      login: 'user',
      firstName: 'firstName',
      lastName: 'lastName',
    );

    print(user1 == user2);
    print(UserModel.fromJson(user1.toJson()));

    // user1 = user1.copyWith(firstName: 'Alexander');

    return Scaffold(
      body: Center(
        child: Text(user1.toString()),
      ),
    );
  }
}
