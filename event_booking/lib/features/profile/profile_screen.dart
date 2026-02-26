import 'package:flutter/material.dart';
import 'organizer_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExpanded = false;
  bool isEditingInterest = false;

  final List<Map<String, dynamic>> interests = [
    {"title": "Games Online", "color": const Color(0xff5669FF)},
    {"title": "Concert", "color": const Color(0xffFF5E5E)},
    {"title": "Music", "color": const Color(0xffFFA24C)},
    {"title": "Art", "color": const Color(0xff8F67FF)},
    {"title": "Movie", "color": const Color(0xff00C48C)},
    {"title": "Others", "color": const Color(0xff2CC8FF)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TOP BAR
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Color(0xff1C1C2D),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1C1C2D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// PROFILE IMAGE
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),

              const SizedBox(height: 20),

              /// NAME
              const Center(
                child: Text(
                  "Ashfak Sayem",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1C1C2D),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// FOLLOWERS
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
                      SizedBox(height: 6),
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
                    height: 40,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Color(0xffE0E0E0),
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
                      SizedBox(height: 6),
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

              const SizedBox(height: 25),

              /// EDIT PROFILE BUTTON
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrganizerProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xff5669FF),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/icons/edit.png",
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Edit Profile",
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

              const SizedBox(height: 35),

              /// ABOUT ME
              const Text(
                "About Me",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1C1C2D),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "Enjoy your favorite dish and lovely time with your friends and family. Food from local food trucks will be available for purchase. We organize amazing events every weekend with music, art and community gatherings.",
                maxLines: isExpanded ? null : 3,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  height: 1.6,
                  fontSize: 15,
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
                child: Row(
                  children: [
                    Text(
                      isExpanded ? "Show Less" : "Read More",
                      style: const TextStyle(
                        color: Color(0xff5669FF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: const Color(0xff5669FF),
                      size: 18,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// INTEREST HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Interest",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1C1C2D),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEditingInterest = !isEditingInterest;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F1FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "CHANGE",
                        style: TextStyle(
                          color: Color(0xff5669FF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// INTEREST CHIPS
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: interests.map((interest) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: interest["color"],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          interest["title"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (isEditingInterest)
                        Positioned(
                          top: -6,
                          right: -6,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                interests.remove(interest);
                              });
                            },
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.close,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
