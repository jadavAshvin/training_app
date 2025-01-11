import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_trainings_app/Modules/home_module/view/training_detail_screen.dart';

import '../../Utilities/app_colors.dart';
import '../../Utilities/app_text_style.dart';
import '../../Utilities/common_functions.dart';
import '../../Utilities/common_widgets.dart';
import 'filter_bottom_sheet.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key}) : super(key: key);

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final List<String> _imageUrls = [
    // Replace with actual image URLs
    'https://via.placeholder.com/350x150',
    'https://via.placeholder.com/350x150',
    'https://via.placeholder.com/350x150',
  ];

  List selectedLocation = [];
  List selectedTraining = [];
  List selectedTrainer = [];
  final List<Training> _trainings = [
    Training(
      title: 'Safe Scrum Master 1',
      date: 'Oct 11-13, 2019',
      time: '08:30 am - 12:30 pm',
      location: 'West Des Moines',
      description:
          'Equip yourself with the Scrum Master skills to deliver maximum value at scale. In this 16-hour live and interactive SSM training, you will learn to successfully plan and execute the Planning Interval (PI) — the primary enabler to align the Scaled Agile Framework® (SAFe®) across all enterprise levels.',
      imageUrl: 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Helen Gribble',
    ),
    Training(
      title: 'Safe Scrum Master 2',
      date: 'Nov 5-7, 2019',
      time: '09:00 am - 05:00 pm',
      location: 'Chicago, IL',
      description:
          'Master the key components of Agile at scale development, learn how Scrum is facilitated throughout the enterprise and build high-performing Agile teams by becoming a servant leader and coach. The SAFe 6.0 Scrum Master (SSM) certification is a designation offered by Scaled Agile, Inc. (Scaled Agile) to practitioners who complete a two-day SSM training by a SAFe Program Consultant and demonstrate their understanding of SAFe by passing the SAFe 6.0 Scrum Master certification exam.',
      imageUrl: 'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Diren Brat',
    ),
    Training(
      title: 'Safe Scrum Master 3',
      date: 'Des 5-7, 2020',
      time: '10:00 am - 05:00 pm',
      location: 'Phoenix, AZ',
      description:
          '''This course is right for professionals in any industry who want to expand their leadership skills, develop and lead teams effectively, and manage organizational change. It's a good match for anyone leading or participating in an agile transformation, or anyone who wants to grow into a leadership role with tools tailored to today's business challenges.''',
      imageUrl: 'https://images.pexels.com/photos/1462980/pexels-photo-1462980.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Visal Brat',
    ),
    Training(
      title: 'Safe Scrum Master 4',
      date: 'Nov 1-7, 2017',
      time: '09:00 am - 10:00 pm',
      location: 'Phoenix, AZ',
      description: 'Master the role of Product Owner in Agile development.',
      imageUrl: 'https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Viren Bhatt',
    ),
    Training(
      title: 'Safe Scrum Master 5',
      date: 'Nov 1-7, 2017',
      time: '06:00 am - 08:00 pm',
      location: 'Dallas, TX',
      description:
          '''Earn Scrum Education Units with every learning opportunity you complete. SEUs are required for certification renewal every two years. Instead of a one-and-done lifetime certification, you'll have a badge that proves to employers your commitment to continuously growing, evolving, and expanding what you know.''',
      imageUrl: 'https://images.pexels.com/photos/3764119/pexels-photo-3764119.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Vipi Berlin',
    ),
    Training(
      title: 'Safe Scrum Master 6',
      date: 'Oct 1-7, 2021',
      time: '06:00 am - 08:00 pm',
      location: 'San Diego, CA',
      description:
          'SAFe Scrum Master is a course designed for Scrum Masters interested in applying the Scaled Agile Framework (SAFe) principles to their organizations. The course covers the key concepts and techniques needed to lead and facilitate Agile teams at scale, including planning and executing iterations, managing backlogs, and coordinating with other teams.',
      imageUrl: 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Harly Berlin',
    ),
    Training(
      title: 'Safe Scrum Master 7',
      date: 'Oct 1-7, 2021',
      time: '06:00 am - 08:00 pm',
      location: 'San Francisco, CA',
      description:
          'Throughout the course, participants will learn how to create a high-performing Agile team, foster collaboration, and use Agile methodologies to deliver value to customers quickly and effectively. Participants will also gain an understanding of the role of the Scrum Master in SAFe, including how to facilitate Scrum events and ceremonies, coach team members, and continuously improve team performance.',
      imageUrl: 'https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Juhin Kat',
    ),
    Training(
      title: 'Safe Scrum Master 8',
      date: 'Jan 8-10, 2022',
      time: '06:00 am - 08:00 pm',
      location: 'New York, ZK',
      description:
          'The course is designed for those with or without experience in Scrum and looking to take their Agile practices to the next level. By the end of the course, participants will have the knowledge and skills needed to become effective Scrum Masters and work as a Scrum Master in a SAFe environment, helping their organizations to achieve better business outcomes and adapt to changing market conditions.',
      imageUrl: 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=800',
      name: 'Ash Kat',
    ),
    // Add more training objects here
  ];

  int _currentCarouselIndex = 0;
  CarouselSliderController carouselSliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorf2f2f2,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: getScreenHeight(context) * 0.55,
                  color: AppColors.primaryColor,
                  child: Column(
                    children: [
                      Container(
                        height: (getScreenHeight(context) * 0.55) * 0.6,
                        color: AppColors.primaryColor,
                      ),
                      Container(
                        height: (getScreenHeight(context) * 0.55) * 0.4,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: (getScreenHeight(context) * 0.55) * 0.01,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trainings',
                              style: white26w900,
                            ),
                            Icon(
                              Icons.menu,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: (getScreenHeight(context) * 0.55) * 0.1),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 15),
                        child: Text(
                          'Highlights',
                          style: white18w700,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              carouselSliderController.nextPage();
                            },
                            child: Container(
                              height: 80,
                              width: 30,
                              color: AppColors.black.withOpacity(0.5),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppColors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: CarouselSlider(
                              carouselController: carouselSliderController,
                              items: _imageUrls.map((url) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return HighlightCard();
                                  },
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 200.0,
                                viewportFraction: 1,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentCarouselIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              carouselSliderController.previousPage();
                            },
                            child: Container(
                              height: 80,
                              width: 30,
                              color: AppColors.black.withOpacity(0.5),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          var result = await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return SortAndFilterView(
                                  selectedLocation:selectedLocation,
                                  selectedTraining:selectedTraining,
                                  selectedTrainer:selectedTrainer,

                              );
                            },
                          );
                          if (result != null) {
                            selectedLocation = result[0];
                            selectedTraining = result[1];
                            selectedTrainer = result[2];
                            setState(() {});
                          } else {
                            selectedLocation.clear();
                            selectedTraining.clear();
                            selectedTrainer.clear();
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 78,
                          margin: EdgeInsets.only(left: 25, top: 30),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.tune_rounded,
                                  size: 20,
                                  color: AppColors.grey,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Filter",
                                  style: black14w500.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _trainings.length,
                itemBuilder: (context, index) {
                  return !((selectedLocation.every((e) => e == _trainings[index].location)) &&
                          (selectedTraining.every((e) => e == _trainings[index].title)) &&
                          (selectedTrainer.every((e) => e == _trainings[index].name)))
                      ? SizedBox()
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return TrainingDetailScreen(training: _trainings[index]);
                                },
                              ),
                            );
                          },
                          child: TrainingCard(
                            training: _trainings[index],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainingCards extends StatelessWidget {
  final Training training;

  const TrainingCards({Key? key, required this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          training.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(training.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(training.date),
            Text(training.time),
            Text(training.location),
          ],
        ),
        onTap: () {
          // Navigate to TrainingDetailScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainingDetailScreen(training: training),
            ),
          );
        },
      ),
    );
  }
}
