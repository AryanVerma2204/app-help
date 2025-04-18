import 'package:flutter/material.dart';
import 'package:mental_health_app/feature/join_now/join_now.dart';
import 'package:mental_health_app/feature/sessions/schedule_session_screen.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/utils/dimensions.dart';
import 'package:mental_health_app/utils/image_resource.dart';
import 'package:mental_health_app/widgets/badge_icon_button.dart';
import 'package:mental_health_app/widgets/textstyles.dart';

class SessionsScreen extends StatefulWidget {
  final String? fromwhere;
  const SessionsScreen({super.key, this.fromwhere = ""});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: widget.fromwhere == "Home" ? 0 : 1,
        shadowColor: const Color.fromARGB(38, 158, 158, 158),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: widget.fromwhere == "Home"
            ? SizedBox.shrink()
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorPalettes.circleBorderColor,
                    width: 4,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage:
                      const AssetImage(ImageResource.profileGirlImage),
                  radius: 20,
                ),
              ),
        actions: [
          widget.fromwhere == "Home"
              ? SizedBox.shrink()
              : BadgeIconButton(
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
        widget.fromwhere == "Home"
            ? SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.size_25,
                    vertical: Dimensions.size_20),
                child: upCommingSessionCard()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "All Sessions",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorPalettes.headerColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              Icon(Icons.sort_outlined)
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.size_28,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.size_25)
                .copyWith(bottom: Dimensions.size_10),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return communityCard();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: Dimensions.size_12,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget upCommingSessionCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DoctorProfileScreen()));
        },
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
                            "Upcoming Session",
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
                            "Let’s open up to the things that\n 7:30 PM - 8:30 PM",
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
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.play_circle,
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
                // filterCard(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleSessionScreen()));
                  },
                  child: Text(
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget filterCard() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScheduleSessionScreen()),
            );
          },
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
