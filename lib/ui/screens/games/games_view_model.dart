// lib/ui/screens/games/games_view_model.dart
import 'package:flutter/foundation.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/strings.dart';
import 'package:lytiq/core/model/match_model.dart';

class GamesViewModel extends ChangeNotifier {
  // sample dates for top date selector
  List<DateTime> dates = List.generate(
    7,
    (i) => DateTime.now().add(Duration(days: i - 3)),
  );

  // sample leagues mapped to matches (for demo)
  final Map<String, List<MatchModel>> leagueMatches = {
    'Premier league': [
      MatchModel(
        leagueAsset: AppAssets.laliga,
        team1Logo: '$dynamicAssets/manchester.png',
        team2Logo: '$dynamicAssets/arsenal.png',
        team1Name: 'Man City',
        team2Name: 'Arsenal',
        score: '0 - 2',
        status: 'FT',
        time: 'FT',
        oddW1: '1.82',
        oddX: '3.20',
        oddW2: '2.65',
        oddLockedX: false,
        oddLockedW2: true,
      ),
      MatchModel(
        leagueAsset: AppAssets.laliga,
        team1Logo: '$dynamicAssets/inter.png',
        team2Logo: '$dynamicAssets/bvb.png',
        team1Name: 'Inter',
        team2Name: 'BVB',
        score: '2 - 2',
        status: 'HT',
        time: 'HT',
        oddW1: '2.30',
        oddX: '3.10',
        oddW2: '2.90',
      ),
    ],
    'Laliga': [
      MatchModel(
        leagueAsset: AppAssets.laliga,
        team1Logo: '$dynamicAssets/bvb.png',
        team2Logo: '$dynamicAssets/arsenal.png',
        team1Name: 'bvb',
        team2Name: 'Arsenal',
        score: '0 - 0',
        status: 'FT',
        time: "23'",
        oddW1: '2.10',
        oddX: '3.40',
        oddW2: '3.00',
      ),
    ],
  };

  int selectedDateIndex = 3; // default to "today" in center

  void selectDate(int index) {
    selectedDateIndex = index;
    notifyListeners();
  }

  List<String> get leagues => leagueMatches.keys.toList();

  List<MatchModel> matchesOf(String league) => leagueMatches[league] ?? [];
}
