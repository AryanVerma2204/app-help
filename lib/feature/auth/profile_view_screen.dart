import 'package:flutter/material.dart';
import 'package:mental_health_app/feature/auth/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String? email;
  const ProfileScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue.shade100,
                        foregroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1565291981226-1283441a98ec?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.edit, size: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Anushka",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$email | 9348033001",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Settings Cards
            buildSettingsCard([
              buildSettingItem(Icons.person_outline, "Edit profile information",
                  onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen()));
              }),
              buildSettingItem(Icons.notifications_none, "Notifications",
                  trailing: Text("ON", style: TextStyle(color: Colors.blue))),
              buildSettingItem(Icons.language, "Language",
                  trailing:
                      Text("English", style: TextStyle(color: Colors.blue))),
            ]),

            buildSettingsCard([
              buildSettingItem(Icons.security, "Security"),
              buildSettingItem(Icons.palette_outlined, "Theme",
                  trailing:
                      Text("Light mode", style: TextStyle(color: Colors.blue))),
            ]),

            buildSettingsCard([
              buildSettingItem(Icons.help_outline, "Help & Support"),
              buildSettingItem(Icons.email_outlined, "Contact us"),
              buildSettingItem(Icons.policy_outlined, "Privacy policy"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsCard(List<Widget> items) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: items),
    );
  }

  Widget buildSettingItem(IconData icon, String title,
      {Widget? trailing, void Function()? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
