import 'package:lytiq/admin_panel/upcoming_matches_managed/upcoming_matches_manager.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/others/base_view_model.dart';

class UpcomingMatchesManagedScreenViewModel extends BaseViewModel {
  final List<UpcomingMatchesManagerModel> matchesList = [
    UpcomingMatchesManagerModel(
      team1Image: AppAssets.city1,
      team1Name: 'Arsenal',
      team1Goals: '0',
      team2Name: 'Liver Pool',
      team2Goals: '2',
      team2Image: AppAssets.city2,
    ),
    UpcomingMatchesManagerModel(
      team1Image: AppAssets.city3,
      team1Name: 'LiverPool',
      team1Goals: '2',
      team2Name: 'Real Madrid',
      team2Goals: '2',
      team2Image: AppAssets.city4,
    ),
    UpcomingMatchesManagerModel(
      team1Image: AppAssets.city1,
      team1Name: 'Arsenal',
      team1Goals: '2',
      team2Name: 'Liver Pool',
      team2Goals: '0',
      team2Image: AppAssets.city2,
    ),
    UpcomingMatchesManagerModel(
      team1Image: AppAssets.city3,
      team1Name: 'LiverPool',
      team1Goals: '2',
      team2Name: 'Real Madrid',
      team2Goals: '8',
      team2Image: AppAssets.city4,
    ),
  ];
}
