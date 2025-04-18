import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/utils/dimensions.dart';
import 'package:mental_health_app/utils/image_resource.dart';
import 'package:mental_health_app/widgets/badge_icon_button.dart';
import 'package:mental_health_app/widgets/textstyles.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int selectedFilterIndex = 0;
  final List<String> filters = ["Trending", "Relationship", "Self Care"];

  final List<Map<String, dynamic>> posts = [
    {
      "userName": "Anonymous User",
      "timeAgo": "Just Now",
      "content":
          "Is there a therapy which can cure crossdressing & BDSM compulsion?",
      "likes": 2,
      "comments": 3,
      "isLiked": false,
    },
    {
      "userName": "Mental Health Guide",
      "timeAgo": "5 min ago",
      "content":
          "Self-care tips: Start with meditation, exercise, and positive affirmations.",
      "likes": 10,
      "comments": 5,
      "isLiked": false,
    },
    {
      "userName": "Anonymous User",
      "timeAgo": "10 min ago",
      "content": "How do I deal with a toxic relationship?",
      "likes": 4,
      "comments": 2,
      "isLiked": false,
    },
    {
      "userName": "Therapist John",
      "timeAgo": "15 min ago",
      "content":
          "Daily gratitude journaling can improve mental health. Have you tried it?",
      "likes": 8,
      "comments": 6,
      "isLiked": false,
    },
    {
      "userName": "Anonymous User",
      "timeAgo": "30 min ago",
      "content": "What are some effective ways to manage anxiety?",
      "likes": 12,
      "comments": 7,
      "isLiked": false,
    },
    {
      "userName": "Mental Wellness Coach",
      "timeAgo": "1 hour ago",
      "content":
          "Start your day with 10 deep breaths and a positive affirmation.",
      "likes": 6,
      "comments": 4,
      "isLiked": false,
    },
    {
      "userName": "Psychologist Lisa",
      "timeAgo": "2 hours ago",
      "content":
          "Cognitive Behavioral Therapy (CBT) is effective for managing stress.",
      "likes": 15,
      "comments": 10,
      "isLiked": false,
    },
    {
      "userName": "Anonymous User",
      "timeAgo": "3 hours ago",
      "content": "How do I stop overthinking before sleeping?",
      "likes": 9,
      "comments": 5,
      "isLiked": false,
    },
    {
      "userName": "Therapist Alex",
      "timeAgo": "4 hours ago",
      "content": "Guided meditation can help with emotional regulation.",
      "likes": 20,
      "comments": 12,
      "isLiked": false,
    },
    {
      "userName": "Mental Health Support",
      "timeAgo": "5 hours ago",
      "content":
          "If you're feeling overwhelmed, take a 5-minute break and breathe deeply.",
      "likes": 13,
      "comments": 8,
      "isLiked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalettes.darkOrangeColor,
        shape: CircleBorder(),
        tooltip: 'Edit',
        onPressed: () {},
        child: const Icon(Icons.edit, color: Colors.white, size: 28),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        shadowColor: const Color.fromARGB(38, 158, 158, 158),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorPalettes.circleBorderColor,
              width: 4,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: const AssetImage(ImageResource.profileGirlImage),
            radius: 20,
          ),
        ),
        actions: [
          BadgeIconButton(
            icon: ImageResource.notificationIcon,
            badgeCount: 1,
          )
        ],
      ),
      body: SafeArea(child: _main()),
    );
  }

  Widget _main() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Wellness Hub",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorPalettes.headerColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(filters.length, (index) {
              return filterCard(index);
            }),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.size_25),
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return communityCard(index);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        )
      ],
    );
  }

  Widget filterCard(int index) {
    bool isSelected = index == selectedFilterIndex;
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedFilterIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.size_15, vertical: Dimensions.size_4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: isSelected
                  ? ColorPalettes.darkOrangeColor
                  : ColorPalettes.filterColor,
            ),
            child: Text(filters[index],
                style: Textstyles.w70014.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? ColorPalettes.whiteColor
                      : ColorPalettes.arrowColor,
                )),
          ),
        ),
        SizedBox(width: Dimensions.size_12),
      ],
    );
  }

  Widget communityCard(int index) {
    Map<String, dynamic> post = posts[index];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            child: Icon(Icons.person),
          ),
          SizedBox(width: Dimensions.size_18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textScaler: TextScaler.noScaling,
                  text: TextSpan(
                      text: post["userName"],
                      style: Textstyles.w50014,
                      children: [
                        TextSpan(
                          text: " • ${post["timeAgo"]}",
                          style: Textstyles.w40012,
                        )
                      ]),
                ),
                SizedBox(height: Dimensions.size_4),
                Text(
                  post["content"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Textstyles.w40014.copyWith(
                    color: ColorPalettes.darkBrownColor,
                  ),
                ),
                SizedBox(height: Dimensions.size_16),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          posts[index]["isLiked"] = !posts[index]["isLiked"];
                          if (posts[index]["isLiked"]) {
                            posts[index]["likes"] += 1;
                          } else {
                            posts[index]["likes"] -= 1;
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            size: 18,
                            color: post["isLiked"]
                                ? ColorPalettes.darkOrangeColor
                                : Colors.grey,
                          ),
                          SizedBox(width: Dimensions.size_6),
                          Text(
                            post["likes"].toString(),
                            style: Textstyles.w40012.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.asset("assets/icon/comment.png"),
                    SizedBox(width: Dimensions.size_6),
                    Text(
                      post["comments"].toString(),
                      style: Textstyles.w40012.copyWith(fontSize: 14),
                    ),
                    SizedBox(width: Dimensions.size_130),
                    Image.asset("assets/icon/share.png"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
