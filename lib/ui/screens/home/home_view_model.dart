import 'package:lytiq/core/model/match_model.dart';
import 'package:lytiq/core/others/base_view_model.dart';
import 'package:lytiq/core/contant/strings.dart';

class HomeViewModel extends BaseViewModel {
  int selectedTab = 0;

  List<String> banners = [
    '$dynamicAssets/banner1.png',
    '$dynamicAssets/banner1.png',
    '$dynamicAssets/banner1.png',
  ];

  List<MatchModel> matches = [
    MatchModel(
      groundImage: "$dynamicAssets/groundImage.jpg",
      leagueAsset: '$dynamicAssets/laliga.png',
      team1Name: 'Inter Milan',
      team1Logo: '$dynamicAssets/inter.png',
      team2Name: 'Borussia Dortmund',
      team2Logo: '$dynamicAssets/manchester.png',
      score: '1 - 0',
      status: 'Live',
      time: '90+',
    ),
    MatchModel(
      groundImage: "$dynamicAssets/groundImage.jpg",
      leagueAsset: '$dynamicAssets/laliga.png',
      team1Name: 'Real Madrid',
      team1Logo: '$dynamicAssets/bvb.png',
      team2Name: 'Barcelona',
      team2Logo: '$dynamicAssets/arsenal.png',
      score: '2 - 1',
      status: 'Live',
      time: '80\'',
    ),
    MatchModel(
      groundImage: "$dynamicAssets/groundImage.jpg",
      leagueAsset: '$dynamicAssets/laliga.png',
      team1Name: 'Real Madrid',
      team1Logo: '$dynamicAssets/bvb.png',
      team2Name: 'Barcelona',
      team2Logo: '$dynamicAssets/arsenal.png',
      score: 'VS',
      status: 'Upcoming',
      time: '6:30',
    ),
    MatchModel(
      groundImage: "$dynamicAssets/groundImage.jpg",
      leagueAsset: '$dynamicAssets/laliga.png',
      team1Name: 'Real Madrid',
      team1Logo: '$dynamicAssets/bvb.png',
      team2Name: 'Barcelona',
      team2Logo: '$dynamicAssets/arsenal.png',
      score: '2 - 1',
      status: 'Top Event',
      time: '80\'',
    ),
  ];

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  ///
  ///. filtering matches
  ///
  List<MatchModel> get filteredMatches {
    if (selectedTab == 0) {
      return matches;
    } else if (selectedTab == 1) {
      return matches.where((m) => m.status == 'Upcoming').toList();
    } else {
      return matches.where((m) => m.status == 'Live').toList();
    }
  }
}
