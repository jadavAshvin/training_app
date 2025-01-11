import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trainings_app/Modules/Utilities/common_functions.dart';

import '../../Utilities/app_colors.dart';
import '../../Utilities/app_text_style.dart';

class SortAndFilterView extends StatefulWidget {
  final List selectedLocation;
  final List selectedTraining;
  final List selectedTrainer;

  const SortAndFilterView({
    super.key,
    required this.selectedLocation,
    required this.selectedTraining,
    required this.selectedTrainer,
  });

  @override
  SortAndFilterViewState createState() => SortAndFilterViewState();
}

class SortAndFilterViewState extends State<SortAndFilterView> {
  List<String> categories = ["Sort by", "Location", "Training Name", "Trainer"];
  int selectedCategoryIndex = 1;

  List<String> locations = ["West Des Moines", "Chicago, IL", "Phoenix, AZ", "Dallas, TX", "San Diego, CA", "San Francisco, CA", "New York, ZK"];
  List<String> trainingName = [
    "Safe Scrum Master 1",
    "Safe Scrum Master 2",
    "Safe Scrum Master 3",
    "Safe Scrum Master 4",
    "Safe Scrum Master 5",
    "Safe Scrum Master 6",
    "Safe Scrum Master 7",
    "Safe Scrum Master 8",
  ];
  List<String> trainer = [
    "Helen Gribble",
    "Diren Brat",
    "Visal Brat",
    "Viren Bhatt",
    "Vipi Berlin",
    "Harly Berlin",
    "Juhin Kat",
    "Ash Kat",
  ];

  Map<String, bool> selectedLocations = {
    "West Des Moines": false,
    "Chicago, IL": false,
    "Phoenix, AZ": false,
    "Dallas, TX": false,
    "San Diego, CA": false,
    "San Francisco, CA": false,
    "New York, ZK": false,
  };
  Map<String, bool> selectedTrainingName = {
    "Safe Scrum Master 1": false,
    "Safe Scrum Master 2": false,
    "Safe Scrum Master 3": false,
    "Safe Scrum Master 4": false,
    "Safe Scrum Master 5": false,
    "Safe Scrum Master 6": false,
    "Safe Scrum Master 7": false,
    "Safe Scrum Master 8": false,
  };
  Map<String, bool> selectedTrainer = {
    "Helen Gribble": false,
    "Diren Brat": false,
    "Visal Brat": false,
    "Viren Bhatt": false,
    "Vipi Berlin": false,
    "Harly Berlin": false,
    "Juhin Kat": false,
    "Ash Kat": false,
  };
  List filteredItems = [];
  final TextEditingController searchController = TextEditingController();

  void performSearch(String query, List items) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = items; // Show all items if search query is empty
      } else {
        filteredItems = items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredItems = locations;
    widget.selectedTraining.forEach((e) {
      selectedTrainingName.forEach((k, v) {
        if (k == e) {
          selectedTrainingName[k] = true;
        }
      });
    });
    widget.selectedTrainer.forEach((e) {
      selectedTrainer.forEach((k, v) {
        if (k == e) {
          if (k == e) {
            selectedTrainer[k] = true;
          }
        }
      });
    });
    widget.selectedLocation.forEach((e) {
      selectedLocations.forEach((k, v) {
        if (k == e) {
          selectedLocations[k] = true;
        }
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.60,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sort and Filters',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.clear,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 15, bottom: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120,
                          child: ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                    if (index == 1) {
                                      filteredItems = locations;
                                    } else if (index == 2) {
                                      filteredItems = trainingName;
                                    } else {
                                      filteredItems = trainer;
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                      width: selectedCategoryIndex == index ? 5 : 0,
                                      color: AppColors.primaryColor,
                                    )),
                                    color: selectedCategoryIndex == index ? Colors.white : Colors.grey[200],
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      fontWeight: selectedCategoryIndex == index ? FontWeight.bold : FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        VerticalDivider(width: 1, color: Colors.grey[300]),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Search Bar
                              if (selectedCategoryIndex == 1 || selectedCategoryIndex == 2 || selectedCategoryIndex == 3)
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                  // child: TextField(
                                  //   decoration: InputDecoration(
                                  //     prefixIcon: const Icon(Icons.search),
                                  //     hintText: "Search",
                                  //     border: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       borderSide:  BorderSide(color: AppColors.colorB6B6B6),
                                  //     ),
                                  //   ),
                                  // ),
                                  child: CupertinoSearchTextField(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.colorB6B6B6),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    onChanged: (val) {
                                      performSearch(
                                          val,
                                          selectedCategoryIndex == 1
                                              ? locations
                                              : selectedCategoryIndex == 2
                                                  ? trainingName
                                                  : trainer);
                                    },
                                  ),
                                ),
                              // Filter Options
                              if (selectedCategoryIndex == 0)
                                const Expanded(
                                  child: Center(
                                    child: Text("Content for Sort by"),
                                  ),
                                ),
                              if (selectedCategoryIndex == 1)
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: filteredItems.length,
                                    itemBuilder: (context, index) {
                                      String location = filteredItems[index];
                                      return Row(
                                        children: [
                                          Checkbox(
                                            activeColor: AppColors.primaryColor,
                                            value: selectedLocations[location],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                selectedLocations[location] = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            location,
                                            style: TextStyle(fontWeight: selectedLocations[location] == true ? FontWeight.w600 : FontWeight.w400),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              if (selectedCategoryIndex == 2)
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: filteredItems.length,
                                    itemBuilder: (context, index) {
                                      String location = filteredItems[index];
                                      return Row(
                                        children: [
                                          Checkbox(
                                            activeColor: AppColors.primaryColor,
                                            value: selectedTrainingName[location],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                selectedTrainingName[location] = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            location,
                                            style: TextStyle(fontWeight: selectedTrainingName[location] == true ? FontWeight.w600 : FontWeight.w400),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              if (selectedCategoryIndex == 3)
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: filteredItems.length,
                                    itemBuilder: (context, index) {
                                      String location = filteredItems[index];
                                      return Row(
                                        children: [
                                          Checkbox(
                                            activeColor: AppColors.primaryColor,
                                            value: selectedTrainer[location],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                selectedTrainer[location] = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            location,
                                            style: TextStyle(fontWeight: selectedTrainer[location] == true ? FontWeight.w600 : FontWeight.w400),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    List selectedLocation = [];
                    List selectedTraining = [];
                    List selectedTrainerName = [];
                    selectedLocations.forEach((k, v) {
                      if (v) {
                        selectedLocation.add(k);
                      }
                    });
                    selectedTrainingName.forEach((k, v) {
                      if (v) {
                        selectedTraining.add(k);
                      }
                    });
                    selectedTrainer.forEach((k, v) {
                      if (v) {
                        selectedTrainerName.add(k);
                      }
                    });
                    Navigator.pop(context, [selectedLocation, selectedTraining, selectedTrainerName]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size((getScreenWidth(context) / 2) - 25, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "Apply",
                    style: white14w500,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    selectedLocations.forEach((k, v) {
                      v = false;
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    minimumSize: Size((getScreenWidth(context) / 2) - 25, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                  child: Text(
                    "Clear",
                    style: black14w500,
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
