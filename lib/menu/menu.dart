import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('asset/cat.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "abc",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "abc@gmail.com",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 35,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: const Color.fromARGB(255, 87, 86, 86),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // SettingsGroup(
            //   title: 'Appearance',
            //   children: const <Widget>[
            //     Appearance(),
            //   ],
            // ),
            // SettingsGroup(
            //   title: 'Adoptions',
            //   children: const <Widget>[],
            // ),
            // SettingsGroup(
            //   title: 'Favorites',
            //   children: const <Widget>[],
            // ),
            // SettingsGroup(
            //   title: 'Privacy',
            //   children: const <Widget>[
            //     Privacy(),
            //   ],
            // ),
            // SettingsGroup(
            //   title: 'Log Out',
            //   children: <Widget>[
            //     TextButton(
            //       onPressed: isLoggedIn ? null : () => const LogOutUser(),
            //       child: const Text("Logout"),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
