import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the entire app
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100.0, // Set a smaller height for the FlexibleSpaceBar
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Your Dashboard',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(color: Colors.green), // Set the background color directly
            ),
            backgroundColor: Colors.green,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSection('Account Overview', _buildAccountOverviewCard()),
                      SizedBox(height: 20),
                      _buildSection('Usage Metrics', _buildUsageMetricsCard()),
                      SizedBox(height: 20),
                      _buildSection('Billing Information', _buildBillingInformationCard()),
                      SizedBox(height: 20),
                      _buildSection('Recent Transactions', _buildRecentTransactions()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.translationValues(isDrawerOpen ? 300 : 0, 0, 0),
        child: AppDrawer(),
      ),
    );
  }

  Widget _buildSection(String title, Widget card) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: 1.0,
          child: card,
        ),
      ],
    );
  }

  Widget _buildAccountOverviewCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardTitle('Current Plan'),
            _buildCardInfo('Premium'),
            SizedBox(height: 10),
            _buildCardTitle('Billing Cycle'),
            _buildCardInfo('01/03/2024 - 31/03/2024'),
            SizedBox(height: 10),
            _buildCardTitle('Account Balance'),
            _buildCardInfo(
              '\$50.00',
              textStyle: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsageMetricsCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardTitle('Data Usage'),
            _buildPieChart(),
            SizedBox(height: 10),
            _buildCardTitle('Call History'),
            _buildCardInfo('50 minutes'),
            SizedBox(height: 10),
            _buildCardTitle('Messages'),
            _buildCardInfo('25 sent, 10 received'),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingInformationCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardTitle('Current Bill Amount'),
            _buildCardInfo(
              '\$30.00',
              textStyle: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 10),
            _buildCardTitle('Due Date'),
            _buildCardInfo('15/04/2024'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to view and download invoices
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'View Invoices',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Recent Transactions'),
            SizedBox(height: 10),
            _buildTransactionItem('Payment', '-\$20.00', '28/02/2024'),
            _buildTransactionItem('Recharge', '+\$30.00', '25/02/2024'),
            _buildTransactionItem('Subscription', '-\$15.00', '20/02/2024'),
            _buildTransactionItem('Payment', '-\$25.00', '15/02/2024'),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date) {
    return ListTile(
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: GoogleFonts.poppins(
          color: amount.startsWith('-') ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    // Omitted for simplicity, as per your request
    return Container();
  }

  Widget _buildCardTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }

  Widget _buildCardInfo(String info, {TextStyle? textStyle}) {
    return Text(
      info,
      style: textStyle ?? GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildPieChart() {
    // Omitted for simplicity, as per your request
    return Container();
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: 1.0,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
