import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/features/search/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  final bool openSearch;
  const EventsScreen({super.key, this.openSearch = false});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool isSearching = false;

  final List<Map<String, String>> allEvents = [
    {
      "image": "assets/images/event1.png",
      "date": "Wed, Apr 28 · 5:30 PM",
      "title": "Jo Malone London’s Mother’s Day Presents",
      "location": "Radius Gallery · Santa Cruz, CA",
    },
    {
      "image": "assets/images/event2.png",
      "date": "Sat, May 1 · 2:00 PM",
      "title": "A Virtual Evening of Smooth Jazz",
      "location": "Lot 13 · Oakland, CA",
    },
    {
      "image": "assets/images/event3.png",
      "date": "Sat, Apr 24 · 1:30 PM",
      "title": "Women's Leadership Conference 2021",
      "location": "53 Bush St · San Francisco, CA",
    },
    {
      "image": "assets/images/event4.png",
      "date": "Fri, Apr 23 · 6:00 PM",
      "title": "International Kids Safe Parents Night Out",
      "location": "Lot 13 · Oakland, CA",
    },
    {
      "image": "assets/images/event5.png",
      "date": "Sun, Apr 25 · 10:15 AM",
      "title": "International Gala Music Festival",
      "location": "36 Guild Street London, UK",
    },
    {
      "image": "assets/images/event6.png",
      "date": "Mon, Jun 21 · 10:00 PM",
      "title": "Collectivity Plays the Music of Jimi",
      "location": "Longboard Margarita Bar",
    },
  ];

  List<Map<String, String>> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    filteredEvents = allEvents;
    if (widget.openSearch) {
      isSearching = true;
    }
  }

  void filterEvents(String query) {
    if (query.length < 2) {
      setState(() {
        filteredEvents = allEvents;
      });
      return;
    }

    setState(() {
      filteredEvents = allEvents
          .where((event) =>
              event["title"]!
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              event["location"]!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  void clearSearch() {
    _searchController.clear();
    setState(() {
      filteredEvents = allEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasQuery = _searchController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        title: const Text(
          "Events",
          style: TextStyle(
            fontFamily: "AirbnbCereal",
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xff1C1C2D),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) {
                        filterEvents(v);
                        setState(() {});
                      },
                      autofocus: isSearching,
                      style: const TextStyle(
                        fontFamily: "AirbnbCereal",
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search for events',
                        hintStyle: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 4),
                            Icon(Icons.search,
                                color: AppColors.primaryColor, size: 26),
                            const SizedBox(width: 2),
                            Text(
                              '|',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  icon: CircleAvatar(
                    backgroundColor: AppColors.backgroundColor,
                    child: const Icon(
                      Icons.filter_list,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                  ),
                  label: const Text(
                    'Filter',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () => showFilterBottomSheet(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: const Size(110, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: hasQuery && filteredEvents.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greycolor,
                        ),
                        child: Center(
                          child:
                              Image.asset("assets/images/calendar.png", width: 140),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "No Upcoming Event",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "No events match your search.\nTry a different keyword.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: filteredEvents
                          .map(
                            (event) => EventCard(
                              image: event["image"]!,
                              date: event["date"]!,
                              title: event["title"]!,
                              location: event["location"]!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String location;

  const EventCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff5669FF).withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              image,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontFamily: "AirbnbCereal",
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5669FF),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "AirbnbCereal",
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1C1C2D),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/location.png",
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontFamily: "AirbnbCereal",
                          fontSize: 14,
                          color: Color(0xff747688),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}