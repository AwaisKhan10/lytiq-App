import 'package:lytiq/core/others/base_view_model.dart';
import 'package:lytiq/ui/screens/select_wheel_coins/select_wheel_coins_screen.dart';

class SelectWheelCoinsViewModel extends BaseViewModel {
  final List<SelectWheelCoinsModel> selectWheelCoinsList = [
    SelectWheelCoinsModel(coins: '100', text: 'Life Time Daily Return 0,18'),
    SelectWheelCoinsModel(coins: '50', text: 'Life Time Daily Return 0,37'),
    SelectWheelCoinsModel(coins: '500', text: 'Life Time Daily Return 1,85'),
    SelectWheelCoinsModel(coins: '250', text: 'Life Time Daily Return  0,92'),
    SelectWheelCoinsModel(coins: '5000', text: 'Life Time Daily Return 19'),
    SelectWheelCoinsModel(coins: '1000', text: 'Life Time  Daily Return 3,7'),
  ];
}
