// lib/models/match_model.dart
class MatchModel {
  String? leagueAsset;
  String? team1Logo;
  String? team2Logo;
  String? team1Name;
  String? team2Name;
  String? score;
  String? status; // Live, FT, HT, etc.
  String? time; // 32', 90+, etc.
  String? oddW1;
  String? oddX;
  String? oddW2;
  bool? oddLockedX;
  bool? oddLockedW2;

  MatchModel({
    this.leagueAsset,
    this.team1Logo,
    this.team2Logo,
    this.team1Name,
    this.team2Name,
    this.score,
    this.status,
    this.time,
    this.oddW1,
    this.oddX,
    this.oddW2,
    this.oddLockedX = false,
    this.oddLockedW2 = false,
  });
}
