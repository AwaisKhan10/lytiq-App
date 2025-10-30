import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:lytiq/admin_panel/live_matches_control/live_matches_view_model.dart';
import 'package:lytiq/admin_panel/upcoming_matches_managed/upcoming_matches_managed_view_model.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/buttons/simple_custom_button.dart';
import 'package:provider/provider.dart';

class UpcomingMatchesManagedScreen extends StatelessWidget {
  const UpcomingMatchesManagedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpcomingMatchesManagedScreenViewModel(),
      child: Consumer<UpcomingMatchesManagedScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: primaryColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () => _showAddMatchDialog(context),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.matchesList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomUpcomingMatchesManagerCard(
                          onLongPressed: () {
                            _showOnLongPressedDialogBox(context);
                            Get.snackbar(
                              'Long press',
                              'Operation on Long press',
                              colorText: whiteColor,
                            );
                          },
                          upcomingMatchesModel: model.matchesList[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///. dialog to add new match
  ///
  void _showAddMatchDialog(BuildContext context) {
    final team1Controller = TextEditingController();
    final team1GoalsController = TextEditingController();
    final team2Controller = TextEditingController();
    final team2GoalsController = TextEditingController();
    final timeController = TextEditingController();

    void showError() {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        colorText: whiteColor,
        backgroundColor: redColor,
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C1F3E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Add New Match',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.9, // ⬅️ increased width
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildField('Team 1 Name', team1Controller),
                  _buildField(
                    'Team 1 Goals',
                    team1GoalsController,
                    isNumber: true,
                  ),
                  _buildField('Team 2 Name', team2Controller),
                  _buildField(
                    'Team 2 Goals',
                    team2GoalsController,
                    isNumber: true,
                  ),
                  _buildField('Match Time', timeController),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (team1Controller.text.isEmpty ||
                    team1GoalsController.text.isEmpty ||
                    team2Controller.text.isEmpty ||
                    team2GoalsController.text.isEmpty ||
                    timeController.text.isEmpty) {
                  showError();
                  return;
                }
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  ///
  ///. field for collecting name and goals when adding new match
  ///
  static Widget _buildField(
    String label,
    TextEditingController controller, {
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: blueColor),
          ),
          filled: true,
          fillColor: const Color(0xFF2A2E57),
        ),
      ),
    );
  }

  ///
  ///. on long pressed what will happen to existing matches
  ///

  void _showOnLongPressedDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C1F3E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          content: SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.9, // ⬅️ increased width
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  15.verticalSpace,
                  CustomButton(text: 'Edit match', onTap: () {}),
                  15.verticalSpace,
                  CustomButton(text: 'Delete match', onTap: () {}),
                  15.verticalSpace,
                  CustomButton(text: 'Display on Top match', onTap: () {}),
                  15.verticalSpace,
                  CustomButton(
                    color: redColor,
                    text: 'Cancel',
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

///  model
class UpcomingMatchesManagerModel {
  final String team1Image;
  final String team2Image;
  final String team1Name;
  final String team2Name;
  final String team1Goals;
  final String team2Goals;
  UpcomingMatchesManagerModel({
    required this.team1Image,
    required this.team1Name,
    required this.team1Goals,
    required this.team2Image,
    required this.team2Name,
    required this.team2Goals,
  });
}

/// custom widget
class CustomUpcomingMatchesManagerCard extends StatelessWidget {
  final UpcomingMatchesManagerModel upcomingMatchesModel;
  final VoidCallback? onLongPressed;
  const CustomUpcomingMatchesManagerCard({
    super.key,
    required this.upcomingMatchesModel,
    this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: purpleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 65.h,
              width: 60.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(upcomingMatchesModel.team1Image),
                ),
              ),
            ),
            15.horizontalSpace,
            Text(upcomingMatchesModel.team1Name, style: style14),
            Spacer(),
            Row(
              children: [
                Text(upcomingMatchesModel.team1Goals, style: style14),
                5.horizontalSpace,
                Text('-', style: style14),
                5.horizontalSpace,
                Text(upcomingMatchesModel.team2Goals, style: style14),
              ],
            ),
            Spacer(),
            Text(upcomingMatchesModel.team2Name, style: style14),
            15.horizontalSpace,
            Container(
              height: 65.h,
              width: 60.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(upcomingMatchesModel.team2Image),
                  scale: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
