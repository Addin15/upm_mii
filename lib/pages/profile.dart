import 'package:flutter/material.dart';
import 'package:upm_mii/controllers/user_controller.dart';
import 'package:upm_mii/pages/profile/edit_profile.dart';
import 'package:upm_mii/pages/profile/landing_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    UserController controller = UserController();
    final name = 'Amirah';
    final email = 'Amirah00@gmail.com';
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: padding,
          children: [
            buildHeader(
              name: name,
              email: email,
            ),
            buildMenuItem(
                text: 'Profile',
                icon: Icons.person_outline,
                onClicked: () => selectedItem(context, 0)),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'My Insurance Plans',
                icon: Icons.lightbulb_outline,
                onClicked: () {}),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'Insurance Bill',
                icon: Icons.payment_outlined,
                onClicked: () {}),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'Claim Insurance',
                icon: Icons.health_and_safety_outlined,
                onClicked: () {}),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'Bills',
                icon: Icons.attach_money_outlined,
                onClicked: () {}),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'Security',
                icon: Icons.security_outlined,
                onClicked: () {}),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'Terms and Conditions',
                icon: Icons.handyman_outlined,
                onClicked: () {}),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'Privacy Policy',
                icon: Icons.privacy_tip_outlined,
                onClicked: () {}),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout_outlined,
                onClicked: () {
                  Navigator.pushReplacementNamed(context, 'signin');
                }),
          ],
        ),
      ),
    );
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.black87;

    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditProfile(),
        ));
    }
  }

  Widget buildHeader({required String name, required String email}) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 15)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
