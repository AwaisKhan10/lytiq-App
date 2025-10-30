import 'package:flutter/material.dart';
import 'package:lytiq/admin_panel/betting_and_settelment_page/betting_settlement_screen.dart';
import 'package:lytiq/admin_panel/dash_board_over_view/dash_board_overView_screen.dart';
import 'package:lytiq/admin_panel/live_matches_control/live_matches_screen.dart';
import 'package:lytiq/admin_panel/upcoming_matches_managed/upcoming_matches_manager.dart';
import 'package:lytiq/admin_panel/user_managments/user_managements_screen.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;

  final List<String> _menuTitles = [
    'Dashboard Overview',
    'Upcoming Matches Manager',
    'Live Matches Control',
    'User Management',
    'Betting & Settlement Page',
  ];

  final List<Widget> _screenList = const [
    // use content-only widget here so Drawer overlays correctly
    DashBoardOverViewScreen(),
    UpcomingMatchesManagedScreen(),
    LiveMatchesScreen(),
    UserManagementsScreen(),
    BettingSettlementScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E2A),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: whiteColor),
        title: Text(
          _menuTitles[_selectedIndex],
          style: style24.copyWith(color: whiteColor),
        ),
      ),
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: primaryColor),
              child: Center(
                child: Text(
                  'Admin Menu',
                  style: TextStyle(
                    color: Colors.yellow.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...List.generate(_menuTitles.length, (index) {
              bool isSelected = _selectedIndex == index;
              return ListTile(
                leading: Icon(
                  Icons.circle,
                  color: isSelected ? Colors.yellow.shade600 : Colors.white54,
                  size: 10,
                ),
                title: Text(
                  _menuTitles[index],
                  style: TextStyle(
                    color: isSelected ? Colors.yellow.shade600 : Colors.white,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() => _selectedIndex = index);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
      body: _screenList[_selectedIndex],
    );
  }
}
