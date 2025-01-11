import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:my_trainings_app/Modules/Utilities/app_colors.dart';

import '../../Utilities/common_widgets.dart';

class TrainingDetailScreen extends StatelessWidget {
  final Training training;

  const TrainingDetailScreen({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(training.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            TrainingCard(
              training: training,
              fromDetail:true,
            ),
            DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: AppColors.primaryColor,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(training.description),
            ),
          ],
        ),
      ),
    );
  }
}

class Training {
  final String title;
  final String date;
  final String time;
  final String location;
  final String description;
  final String imageUrl;
  final String name;

  Training({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.imageUrl, required this. name,
  });
}