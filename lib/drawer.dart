import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Your User Name',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem('Alerts and Notifications', Icons.notifications, () {
            // Implement logic for handling alerts and notifications
            // Example: Show a dialog with a list of notifications
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alerts and Notifications'),
                  content: Text('List of notifications goes here.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          }),
          _buildDrawerItem('Technical Support', Icons.headset, () {
            // Implement logic for handling technical support
            // Example: Navigate to a support screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TechnicalSupportScreen()),
            );
          }),
          _buildDrawerItem('Service Status', Icons.settings_ethernet, () {
            // Implement logic for handling service status
            // Example: Navigate to a screen displaying service status
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServiceStatusScreen()),
            );
          }),
          _buildDrawerItem('Promotions and Offers', Icons.local_offer, () {
            // Implement logic for handling promotions and offers
            // Example: Navigate to a screen with promotional details
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PromotionsScreen()),
            );
          }),
          _buildDrawerItem('Feedback and Survey', Icons.rate_review, () {
            // Implement logic for handling feedback and survey
            // Example: Navigate to a feedback/survey screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeedbackScreen()),
            );
          }),
          _buildDrawerItem('Security and Account Settings', Icons.security, () {
            // Implement logic for handling security and account settings
            // Example: Navigate to an account settings screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}

// Example screens for each drawer item
class TechnicalSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technical Support'),
      ),
      body: Center(
        child: Text('Technical Support Screen'),
      ),
    );
  }
}

class ServiceStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Status'),
      ),
      body: Center(
        child: Text('Service Status Screen'),
      ),
    );
  }
}

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions and Offers'),
      ),
      body: Center(
        child: Text('Promotions and Offers Screen'),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback and Survey'),
      ),
      body: Center(
        child: Text('Feedback and Survey Screen'),
      ),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security and Account Settings'),
      ),
      body: Center(
        child: Text('Account Settings Screen'),
      ),
    );
  }
}
