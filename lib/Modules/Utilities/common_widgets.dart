import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:my_trainings_app/Modules/Utilities/app_text_style.dart';
import 'package:my_trainings_app/Modules/Utilities/common_functions.dart';

import '../home_module/view/training_detail_screen.dart';
import 'app_colors.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        height: 200,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: NetworkImage(
              'https://images.pexels.com/photos/2678468/pexels-photo-2678468.jpeg?auto=compress&cs=tinysrgb&w=800', // Replace with actual image URL
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.2),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Safe Scrum Master",
                        style: white18w700,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "West Des Moines, IA - 30 Oct - 31 Oct",
                        style: white12w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$975",
                            style: primary12w400.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "\$825",
                            style: primary15w500,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle "View Details" action
                        },
                        child: Row(
                          children: [
                            Text(
                              "View Details",
                              style: white12w400,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainingCard extends StatelessWidget {
  final Training training;
  final bool? fromDetail;

  const TrainingCard({super.key, required this.training, this.fromDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15.0),
      child: Column(
        children: [
          EventCard(
            date: training.date,
            time: training.time,
            location: training.location,
            status: "Filling Fast!",
            statusColor: Colors.red,
            title: training.title,
            speakerName: training.name,
            speakerImage: training.imageUrl,
            description: (fromDetail ?? false) ? training.description : '',
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String date;
  final String time;
  final String location;
  final String status;
  final Color statusColor;
  final String title;
  final String speakerName;
  final String speakerImage;
  final String description;

  const EventCard({
    super.key,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.statusColor,
    required this.title,
    required this.speakerName,
    required this.speakerImage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height:  175,
      width: getScreenWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Expanded(child: Text(time, style: black12w300.copyWith(fontSize: 10))),
                    // SizedBox(height: 60),
                    // Spacer(),
                    SizedBox(
                      width: 100,
                      child: Text(
                        location,
                        style: black12w500,
                      ),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
                SizedBox(width: 10),
                DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: AppColors.grey,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(title, style: black14w700.copyWith(fontSize: 16)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(speakerImage),
                            radius: 24,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Keynote Speaker",
                                style: black12w600,
                              ),
                              Text(
                                speakerName,
                                style: black12w300,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.all(3),
                            minimumSize: Size(90, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text(
                            "Enroll Now",
                            style: white14w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
