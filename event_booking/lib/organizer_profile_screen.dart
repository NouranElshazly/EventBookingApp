import 'package:flutter/material.dart';

class OrganizerProfileScreen extends StatefulWidget {
  const OrganizerProfileScreen({super.key});

  @override
  State<OrganizerProfileScreen> createState() =>
      _OrganizerProfileScreenState();
}

class _OrganizerProfileScreenState
    extends State<OrganizerProfileScreen> {
  int selectedTab = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [

              const SizedBox(height: 8),

              /// 🔹 TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Color(0xff1C1C2D),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 22,
                      color: Color(0xff1C1C2D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔹 PROFILE IMAGE
              const CircleAvatar(
                radius: 55,
                backgroundImage:
                    AssetImage("assets/images/profile.png"),
              ),

              const SizedBox(height: 18),

              /// 🔹 NAME
              const Text(
                "David Silbia",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1C1C2D),
                ),
              ),

              const SizedBox(height: 22),

              /// 🔹 FOLLOWERS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  Column(
                    children: [
                      Text(
                        "350",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1C1C2D),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Following",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff747688),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 30),

                  SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Color(0xffE6E6E6),
                    ),
                  ),

                  SizedBox(width: 30),

                  Column(
                    children: [
                      Text(
                        "346",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1C1C2D),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Followers",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff747688),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// 🔹 BUTTONS
              Row(
                children: [

                  /// FOLLOW
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff5669FF),
                            Color(0xff4F5DE4),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/follow.png",
                            height: 18,
                            width: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// MESSAGE
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color:
                              const Color(0xff5669FF),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/message.png",
                            height: 18,
                            width: 18,
                            color:
                                const Color(0xff5669FF),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Messages",
                            style: TextStyle(
                              color:
                                  Color(0xff5669FF),
                              fontWeight:
                                  FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// 🔹 TABS
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  buildTab("ABOUT", 0),
                  buildTab("EVENT", 1),
                  buildTab("REVIEWS", 2),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔹 CONTENT
              Expanded(
                child: selectedTab == 0
                    ? buildAbout()
                    : selectedTab == 1
                        ? buildEvents()
                        : buildReviews(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 ABOUT
  Widget buildAbout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Text(
            isExpanded
                ? "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. We organize amazing events every weekend with music, art and community gatherings."
                : "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.",
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xff747688),
            ),
          ),

          const SizedBox(height: 6),

          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded
                  ? "Read Less"
                  : "Read More",
              style: const TextStyle(
                color: Color(0xff5669FF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 EVENTS
  Widget buildEvents() {
    return ListView(
      children: const [
        EventCard("assets/images/event1.png",
            "A virtual evening of smooth jazz"),
        EventCard("assets/images/event2.png",
            "Jo malone london’s mother’s day"),
        EventCard("assets/images/event3.png",
            "Women's leadership conference"),
        EventCard("assets/images/event4.png",
            "International kids safe parents night out"),
        EventCard("assets/images/event5.png",
            "International gala music festival"),
      ],
    );
  }

  /// 🔹 REVIEWS
  Widget buildReviews() {
    return ListView(
      children: const [
        ReviewItem("Rocks Velkeinjen"),
        ReviewItem("Angelina Zolly"),
        ReviewItem("Zenifero Bolex"),
      ],
    );
  }

  Widget buildTab(String text, int index) {
    bool active = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: active
                  ? const Color(0xff5669FF)
                  : const Color(0xffA1A1B5),
            ),
          ),
          const SizedBox(height: 6),
          if (active)
            Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xff5669FF),
                borderRadius:
                    BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }
}

/// EVENT CARD
class EventCard extends StatelessWidget {
  final String image;
  final String title;

  const EventCard(this.image, this.title,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F9),
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(15),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  "1ST MAY- SAT -2:00 PM",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        FontWeight.w600,
                    color:
                        Color(0xff5669FF),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.w600,
                    color:
                        Color(0xff1C1C2D),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// REVIEW ITEM
class ReviewItem extends StatelessWidget {
  final String name;

  const ReviewItem(this.name,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage:
                    AssetImage(
                        "assets/images/profile.png"),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
              ),
              const Text(
                "10 Feb",
                style: TextStyle(
                  color:
                      Color(0xffA1A1B5),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "⭐⭐⭐⭐",
            style:
                TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            "Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.",
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color:
                  Color(0xff747688),
            ),
          )
        ],
      ),
    );
  }
}