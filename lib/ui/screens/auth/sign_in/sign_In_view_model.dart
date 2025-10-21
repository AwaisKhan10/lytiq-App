import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();

  Country _selectedCountry = Country(
    phoneCode: '971',
    countryCode: 'AE',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'United Arab Emirates',
    example: '050 123 4567',
    displayName: 'United Arab Emirates',
    displayNameNoCountryCode: 'UAE',
    e164Key: '',
  );

  Country get selectedCountry => _selectedCountry;

  void setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
