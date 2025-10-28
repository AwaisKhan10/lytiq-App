// lib/ui/screens/games/widgets/match_card.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lytiq/core/model/match_model.dart';

class MatchCard extends StatelessWidget {
  final MatchModel match;
  final EdgeInsetsGeometry padding;

  const MatchCard({
    Key? key,
    required this.match,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const whiteColor = Colors.white;
    const greyColor = Colors.grey;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFF161233),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // league logo left (optional)
          Row(
            children: [
              if (match.leagueAsset!.isNotEmpty)
                Image.asset(match.leagueAsset ?? "", scale: 3),
            ],
          ),
          const SizedBox(height: 10),

          // main row: team1, score/status/time, team2
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Team 1
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(match.team1Logo ?? ""),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        match.team1Name ?? "",
                        style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              // Score and status
              Column(
                children: [
                  Text(
                    match.score ?? "",
                    style: const TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: match.status!.toLowerCase() == 'live'
                          ? Colors.green.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      match.status ?? "",
                      style: TextStyle(
                        color: match.status!.toLowerCase() == 'live'
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    match.time ?? "",
                    style: const TextStyle(color: greyColor, fontSize: 12),
                  ),
                ],
              ),

              // Team 2
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        match.team2Name ?? "",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(match.team2Logo ?? ""),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
