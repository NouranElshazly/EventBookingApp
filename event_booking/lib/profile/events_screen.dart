import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: isSearching
                    ? Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isSearching = false;
                                clearSearch();
                              });
                            },
                            icon: const Icon(Icons.arrow_back_ios_new),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: TextField(
                                controller: _searchController,
                                onChanged: filterEvents,
                                autofocus: true,
                                style: const TextStyle(
                                  fontFamily: "AirbnbCereal",
                                  fontSize: 16,
                                ),
                                decoration: const InputDecoration(
                                  hintText: "Search events...",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon:
                                const Icon(Icons.arrow_back_ios_new),
                          ),
                          const Expanded(
                            child: Text(
                              "Events",
                              style: TextStyle(
                                fontFamily: "AirbnbCereal",
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff1C1C2D),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isSearching = true;
                              });
                            },
                            icon: const Icon(Icons.search),
                          ),
                          IconButton(
                            onPressed: () {
                     
                            },
                            icon: const Icon(Icons.more_vert),
                          ),
                        ],
                      ),
              ),

           
              Padding(
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
            ],
          ),
        ),
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