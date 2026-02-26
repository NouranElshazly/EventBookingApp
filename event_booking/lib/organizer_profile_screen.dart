import 'package:flutter/material.dart';

class OrganizerProfileScreen extends StatefulWidget {
  const OrganizerProfileScreen({super.key});

  @override
  State<OrganizerProfileScreen> createState() =>
      _OrganizerProfileScreenState();
}

class _OrganizerProfileScreenState extends State<OrganizerProfileScreen> {
  int selectedTab = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 8),

                /// TOP BAR
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

                ///  PROFILE IMAGE
                const CircleAvatar(
                  radius: 55,
                  backgroundImage:
                      AssetImage("assets/images/profile.png"),
                ),

                const SizedBox(height: 18),

                ///  NAME
                const Text(
                  "David Silbia",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1C1C2D),
                  ),
                ),

                const SizedBox(height: 22),

                ///  FOLLOWERS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Column(
                      children: [
                        Text("350",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 4),
                        Text("Following",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff747688))),
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
                        Text("346",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 4),
                        Text("Followers",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff747688))),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                ///  BUTTONS
                Row(
                  children: [
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
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/icons/follow.png"),
                                width: 20,
                                height: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Follow",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xff5669FF),
                            width: 1.5,
                          ),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/icons/messages.png"),
                                width: 20,
                                height: 20,
                                color: Color(0xff5669FF),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Messages",
                                style: TextStyle(
                                  color: Color(0xff5669FF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                ///  TABS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTab("ABOUT", 0),
                    buildTab("EVENT", 1),
                    buildTab("REVIEWS", 2),
                  ],
                ),

                const SizedBox(height: 20),

                if (selectedTab == 0)
                  buildAbout()
                else if (selectedTab == 1)
                  buildEvents()
                else
                  buildReviews(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded
              ? "Enjoy your favorite dishes with your friends and family and have a great time. We organize amazing events every weekend."
              : "Enjoy your favorite dishes with your friends and family.",
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
            isExpanded ? "Read Less" : "Read More",
            style: const TextStyle(
              color: Color(0xff5669FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEvents() {
    return const Column(
      children: [
        EventCard(
          image: "assets/images/event1.png",
          date: "1ST MAY- SAT -2:00 PM",
          title: "A virtual evening of smooth jazz",
        ),
        EventCard(
          image: "assets/images/event2.png",
          date: "1ST MAY- SAT -2:00 PM",
          title: "Jo malone london’s mother’s day",
        ),
        EventCard(
          image: "assets/images/event3.png",
          date: "1ST MAY- SAT -2:00 PM",
          title: "Women's leadership conference",
        ),
        EventCard(
          image: "assets/images/event4.png",
          date: "1ST MAY- SAT -2:00 PM",
          title: "International kids safe parents night out",
        ),
        EventCard(
          image: "assets/images/event5.png",
          date: "1ST MAY- SAT -2:00 PM",
          title: "International gala music festival",
        ),
      ],
    );
  }

  Widget buildReviews() {
    return const Column(
      children: [
        ReviewItem(
          name: "Rocks Velkeinjen",
          image: "assets/images/review1.png",
        ),
        ReviewItem(
          name: "Angelina Zolly",
          image: "assets/images/review2.png",
        ),
        ReviewItem(
          name: "Zenifero Bolex",
          image: "assets/images/review3.png",
        ),
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
                borderRadius: BorderRadius.circular(10),
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

  const EventCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
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
            color: const Color(0xff5669FF).withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(0, 10),
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
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5669FF),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1C1C2D),
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

class ReviewItem extends StatelessWidget {
  final String name;
  final String image;

  const ReviewItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Text(
                "10 Feb",
                style: TextStyle(
                  color: Color(0xffA1A1B5),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          const Text("⭐⭐⭐⭐"),
          const SizedBox(height: 8),
          const Text(
            "Cinemas is the ultimate experience to see new movies in Gold Class or Vmax.",
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Color(0xff747688),
            ),
          )
        ],
      ),
    );
  }
}