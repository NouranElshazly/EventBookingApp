import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';
import 'package:event_booking/features/search/event_card/event_card_model.dart';
import 'package:flutter/material.dart';

class SearchWhiteBar extends StatelessWidget {
  const SearchWhiteBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Text('Search', style: TextStyles.appbar),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 16.0,
                      bottom: 16.0,
                      right: 120.0,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for events',
                          hintStyle: TextStyle(
                            color: AppColors.titleColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 1),
                              Icon(
                                Icons.search,
                                color: AppColors.primaryColor,
                                size: 30,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(width: 1),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 35,
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: CircleAvatar(
                      backgroundColor: AppColors.backgroundColor,
                      child: const Icon(
                        Icons.filter_list,
                        color: AppColors.primaryColor,
                        size: 25,
                      ),
                    ),
                    label: const Text(
                      'Filter',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(125, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      side: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              EventCardModel(
                title: '1st  May- Sat -2:00 PM',
                text: 'A virtual evening of \n smooth jazz',
                eventImage: 'assets/images/event1.png',
              ),
              Divider(
                color: AppColors.accentColor,
                thickness: 1.0,
                indent: 16.0,
                endIndent: 16.0,
              ),
              EventCardModel(
                title: '1st  May- Sat -2:00 PM',
                text: 'Jo malone london’s \n mother’s day ',
                eventImage: 'assets/images/event2.png',
              ),
              Divider(
                color: AppColors.accentColor,
                thickness: 1.0,
                indent: 16.0,
                endIndent: 16.0,
              ),
              EventCardModel(
                title: '1st  May- Sat -2:00 PM',
                text: 'Womens leadership\n conference',
                eventImage: 'assets/images/event3.png',
              ),
              Divider(
                color: AppColors.accentColor,
                thickness: 1.0,
                indent: 16.0,
                endIndent: 16.0,
              ),
              EventCardModel(
                title: '1st  May- Sat -2:00 PM',
                text: 'International kids safe \n parents night out',
                eventImage: 'assets/images/event4.png',
              ),
              Divider(
                color: AppColors.accentColor,
                thickness: 1.0,
                indent: 16.0,
                endIndent: 16.0,
              ),
              EventCardModel(
                title: '1st  May- Sat -2:00 PM',
                text: 'International gala \n music festival',
                eventImage: 'assets/images/event5.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
