import 'package:flutter/material.dart';
import 'package:mental_health_app/feature/auth/profile_view_screen.dart';
import 'package:mental_health_app/feature/join_now/join_now.dart';
import 'package:mental_health_app/feature/library/library_view.dart';
import 'package:mental_health_app/feature/navigator/model/feeling_model.dart';
import 'package:mental_health_app/feature/sessions/sessions_screen.dart';
import 'package:mental_health_app/feature/yoga_meditation/yoga_meditation_view.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/utils/dimensions.dart';
import 'package:mental_health_app/utils/image_resource.dart';
import 'package:mental_health_app/widgets/textstyles.dart';

class HomeView extends StatefulWidget {
  final String? email;
  const HomeView({super.key, this.email});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<FeelingModel> feelings = [
    FeelingModel(
        name: "Happy",
        iconPath: ImageResource.happyIcon,
        color: ColorPalettes.pinkColor),
    FeelingModel(
        name: "Calm",
        iconPath: ImageResource.calmIcon,
        color: ColorPalettes.purpleColor),
    FeelingModel(
        name: "Manic",
        iconPath: ImageResource.relax,
        color: ColorPalettes.skyColor),
    FeelingModel(
        name: "Angry",
        iconPath: ImageResource.angryIcon,
        color: ColorPalettes.orangeColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              email: widget.email,
                            )));
              },
              child: Icon(
                Icons.edit,
                color: ColorPalettes.darkOrangeColor,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Head
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Good Afternoon,\n",
                    style: TextStyle(
                      height: 1.5,
                      color: ColorPalettes.headerColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: widget.email ?? "Kriti!",
                    style: TextStyle(
                      color: ColorPalettes.headerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 26,
            ),

            //Today's Feeling
            Text(
              "How are you feeling today?",
              maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorPalettes.headerColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    feelings.length,
                    (index) => InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24, top: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: feelings[index].color,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Image.asset(
                                    feelings[index].iconPath,
                                    width: 33,
                                    height: 33,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  feelings[index].name,
                                  style: TextStyle(
                                    color: ColorPalettes.headerColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            SizedBox(
              height: 26,
            ),

            bookNowCard(),
            SizedBox(
              height: 26,
            ),

            Row(
              children: [
                Expanded(
                    child: buttonIconContainer(
                  "Journal",
                  ImageResource.journalIcon,
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YogaMeditationScreen()));
                  },
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: buttonIconContainer(
                  "Library",
                  ImageResource.libraryIcon,
                  () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LibraryPage()));
                  },
                )),
              ],
            ),
            SizedBox(
              height: 26,
            ),
            qouteCard(),
            SizedBox(
              height: 26,
            ),

            //Chat Card
            chatCard(),

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonIconContainer(String name, String icon, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration: BoxDecoration(
          color: ColorPalettes.lightGreyColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                icon,
                width: 33,
                height: 33,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorPalettes.headerColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget qouteCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: ColorPalettes.lightGreyColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "“It is better to conquer yourself than to win a thousand battles”",
              maxLines: 3,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorPalettes.headerColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Image.asset(
            ImageResource.quoteIcon,
            width: 30,
            height: 30,
          )
        ],
      ),
    );
  }

  Widget bookNowCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SessionsScreen(
                      fromwhere: "Home",
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              color: ColorPalettes.sessionCardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1 on 1 Sessions",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorPalettes.headerColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Let’s open up to the things that\n matter the most ",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              height: 1.2,
                              color: ColorPalettes.headerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Text(
                                "Book Now",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  height: 1.8,
                                  color: ColorPalettes.darkOrangeColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: ColorPalettes.darkOrangeColor,
                                size: 24,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      ImageResource.bookNowImage,
                      width: 75,
                      height: 75,
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    ImageResource.bookNowCornerImage,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget communityCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ColorPalettes.sessionCardColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
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
                          text: "Sahana V",
                          style: Textstyles.w50014,
                        ),
                      ),
                      SizedBox(height: Dimensions.size_4),
                      Text(
                        "Msc in Clinical Psychology",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Textstyles.w40014.copyWith(
                          color: ColorPalettes.darkBrownColor,
                        ),
                      ),
                      SizedBox(height: Dimensions.size_16),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: Color(0xffD9D8D8).withOpacity(0.30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(width: Dimensions.size_6),
                      Text(
                        "1st March ‘25",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Textstyles.w40012.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(width: Dimensions.size_6),
                    Text(
                      "7:30 PM - 8:30 PM",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Textstyles.w40012.copyWith(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: Dimensions.size_14,
            ),
            Row(
              children: [
                filterCard(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorProfileScreen()));
                  },
                  child: Text(
                    "Join Now",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      height: 1.8,
                      color: ColorPalettes.darkOrangeColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget chatCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            color: ColorPalettes.greenColor,
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chat with us",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorPalettes.whiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Get back chat access and\nsessions.",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            height: 1.2,
                            color: ColorPalettes.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Click On Chat Icon",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorPalettes.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: ColorPalettes.whiteColor,
                              size: 24,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    ImageResource.chatImage,
                    width: 75,
                    height: 75,
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  ImageResource.chatCornerImage,
                ))
          ],
        ),
      ),
    );
  }

  Widget filterCard() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.size_15, vertical: Dimensions.size_4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: ColorPalettes.darkOrangeColor),
            child: Text("Reschedule",
                style: Textstyles.w70014.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorPalettes.whiteColor)),
          ),
        ),
        SizedBox(width: Dimensions.size_12),
      ],
    );
  }
}
