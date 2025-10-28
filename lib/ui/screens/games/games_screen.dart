// lib/ui/screens/games/games_screen.dart
// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lytiq/core/model/match_model.dart';
import 'package:lytiq/ui/custom_widget/match_card.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/custom_scaffold/custom_scaffold.dart';
import 'games_view_model.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GamesViewModel(),
      child: Consumer<GamesViewModel>(
        builder: (context, vm, child) {
          return CustomScaffold(
            showAppBar: false,
            backgroundColor: const Color(0xFF0A0A1A),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                // top time/status row (optional)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      Text('22:45', style: TextStyle(color: Colors.white70)),
                      Spacer(),
                      // small status icons (mobile, wifi, battery) could be left to system
                    ],
                  ),
                ),

                // Date selector
                DateSelector(
                  dates: vm.dates,
                  selectedIndex: vm.selectedDateIndex,
                  onSelect: vm.selectDate,
                ),

                const SizedBox(height: 12),

                // Content
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    children: [
                      // For each league
                      for (final league in vm.leagues) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                league,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ),

                        // matches for league
                        ...vm
                            .matchesOf(league)
                            .map((MatchModel m) => MatchCard(match: m))
                            .toList(),
                      ],

                      const SizedBox(height: 80), // bottom padding for nav
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    bool active = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.white : Colors.white70),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _centerWheel() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [Colors.purple, Colors.blueAccent]),
        boxShadow: [
          BoxShadow(color: Colors.purple.withOpacity(0.3), blurRadius: 8),
        ],
      ),
      child: const Center(
        child: Icon(Icons.sports_cricket, color: Colors.white),
      ),
    );
  }
}

class DateSelector extends StatelessWidget {
  final List<DateTime> dates;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const DateSelector({
    Key? key,
    required this.dates,
    required this.selectedIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, idx) {
          final d = dates[idx];
          final dayLabel = DateFormat('EEE').format(d).toUpperCase(); // THU
          final dateLabel = DateFormat('dd-MMM').format(d); // 21-Jan
          final isSelected = idx == selectedIndex;

          return GestureDetector(
            onTap: () => onSelect(idx),
            child: Container(
              width: 92,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF7B4CF8)
                    : const Color(0xFF0E0B1A),
                borderRadius: BorderRadius.circular(12),
                border: isSelected
                    ? null
                    : Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayLabel,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isSelected ? 'TODAY' : dateLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
