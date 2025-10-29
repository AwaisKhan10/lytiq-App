import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lytiq/core/model/my_bet_model.dart';
import 'package:lytiq/core/others/base_view_model.dart';

class HistoryViewModel extends BaseViewModel {
  final List<MyBetModel> betList = [
    MyBetModel(
      city1: 'Real Madrid',
      city2: 'Barcelona',
      status: 'Active',
      date: '29 Oct',
      time: '8:00',
      stack: '800',
      potentialReward: '453',
      buttontext: ' Secure prediction',
    ),

    MyBetModel(
      city1: 'Pakistan',
      city2: 'India',
      status: 'Lose',
      date: '29 Oct',
      time: '8:00',
      stack: '800',
      potentialReward: '453',
      buttontext: 'Better luck next time!!',
    ),

    MyBetModel(
      city1: 'Australia',
      city2: 'SouthKorea',
      status: 'Win',
      date: '29 Oct',
      time: '8:00',
      stack: '800',
      potentialReward: '453',
      buttontext: 'Well done!!',
    ),
  ];


}
