import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:upm_mii/controllers/home_controller.dart';
import 'package:upm_mii/controllers/user_plan_controller.dart';
import 'package:upm_mii/models/news.dart';
import 'package:upm_mii/models/subscribed_plan.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/pages/home/billing.dart';
import 'package:upm_mii/pages/home/news.dart';
import 'package:upm_mii/pages/home/view_subscribed_plan.dart';
import 'package:upm_mii/pages/plans/company_list.dart';
import 'package:upm_mii/pages/plans/insurance_plan_list.dart';
import 'package:upm_mii/constants/style.dart';

class LoadHome extends StatefulWidget {
  const LoadHome({this.user, Key? key}) : super(key: key);

  final User? user;

  @override
  State<LoadHome> createState() => _LoadHomeState();
}

class _LoadHomeState extends State<LoadHome> {
  Future<Map<String, dynamic>> getData() async {
    List<News> news = await NewsController.getNews();
    List<SubscribedPlan> userPlans =
        await UserPlanController.getUserPlan(widget.user!.id!);

    return {
      'news': news,
      'user_plan': userPlans,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const SpinKitDancingSquare(
              color: Color(0xff243E82),
            ),
          );
        } else {
          return Home(
            user: widget.user,
            news: snapshot.data!['news'] as List<News>,
            subscribedPlan: snapshot.data!['user_plan'] as List<SubscribedPlan>,
          );
        }
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({this.user, this.news, this.subscribedPlan, Key? key})
      : super(key: key);

  final User? user;
  final List<News>? news;
  final List<SubscribedPlan>? subscribedPlan;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<News> news = [];

  @override
  void initState() {
    news = widget.news!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.subscribedPlan!.length);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderWithSearchBox(username: widget.user!.username, size: size),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Billing()));
            },
            child: BillSubcription(),
          ),
          const SizedBox(
            height: 15,
          ),
          const TitleWithbutton(text: "News"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...news.map((item) {
                  return NewsCard(
                    image: item.image!,
                    title: item.title!,
                    date: item.date!,
                    url: item.url!,
                  );
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const TitleWithbutton(text: "Your Plans"),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.blue[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlanCard(
                    img: 'assets/plan.png',
                    label: 'All',
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ViewSubscribedPlan(
                                    type: 'All',
                                    plans: widget.subscribedPlan,
                                  )));
                    },
                  ),
                  PlanCard(
                    img: 'assets/life.jpeg',
                    label: 'Life',
                    onTap: () {
                      List<SubscribedPlan> passedPlans = [];
                      for (SubscribedPlan plan in widget.subscribedPlan!) {
                        if (plan.insurancePlan!.type!
                            .toLowerCase()
                            .contains('life')) {
                          passedPlans.add(plan);
                        }
                      }

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ViewSubscribedPlan(
                                    type: 'Life',
                                    plans: passedPlans,
                                  )));
                    },
                  ),
                  PlanCard(
                    img: 'assets/pill.jpg',
                    label: 'Medical',
                    onTap: () {
                      List<SubscribedPlan> passedPlans = [];
                      for (SubscribedPlan plan in widget.subscribedPlan!) {
                        if (plan.insurancePlan!.type!
                            .toLowerCase()
                            .contains('medical')) {
                          passedPlans.add(plan);
                        }
                      }

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ViewSubscribedPlan(
                                    type: 'Medical',
                                    plans: passedPlans,
                                  )));
                    },
                  ),
                  PlanCard(
                    img: 'assets/property.jpeg',
                    label: 'Property',
                    onTap: () {
                      List<SubscribedPlan> passedPlans = [];
                      for (SubscribedPlan plan in widget.subscribedPlan!) {
                        if (plan.insurancePlan!.type!
                            .toLowerCase()
                            .contains('property')) {
                          passedPlans.add(plan);
                        }
                      }

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ViewSubscribedPlan(
                                    type: 'Property',
                                    plans: passedPlans,
                                  )));
                    },
                  ),
                  PlanCard(
                    img: 'assets/car.jpg',
                    label: 'Automobile',
                    onTap: () {
                      List<SubscribedPlan> passedPlans = [];
                      for (SubscribedPlan plan in widget.subscribedPlan!) {
                        if (plan.insurancePlan!.type!
                            .toLowerCase()
                            .contains('automobile')) {
                          passedPlans.add(plan);
                        }
                      }

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ViewSubscribedPlan(
                                    type: 'Automobile',
                                    plans: passedPlans,
                                  )));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  const PlanCard({this.img, this.label, this.onTap, Key? key})
      : super(key: key);

  final String? img;
  final String? label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                img!,
                fit: BoxFit.fill,
                height: 40,
                width: 50,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.date,
      required this.url})
      : super(key: key);

  final String image;
  final String title;
  final DateTime date;
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 400,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Newspage(
                        title: title,
                        date: date,
                        url: url,
                      )));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.blue[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.network(
                          image,
                          height: 170,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  DateFormat.yMMMd().format(date),
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleWithbutton extends StatelessWidget {
  const TitleWithbutton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        height: 24,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(right: 10 / 4),
                height: 7,
              ),
            ),
          ],
        ));
  }
}

class BillSubcription extends StatelessWidget {
  const BillSubcription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.blue[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Total Amount Due",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "RM 81.00",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "as of 10 april 2022",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    this.username,
    Key? key,
    required this.size,
  }) : super(key: key);

  final String? username;

  final Size size;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: (2 / 10 * height) + 30,
      child: Stack(
        children: [
          Container(
            height: 2 / 10 * height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff243E82),
                  Color(0xff00AAE0),
                ],
              ),
              //borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(36),
              // bottomRight: Radius.circular(36)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'InsureME',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '"To save you in time of need"',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                  ],
                ),
                Text(
                  'Welcome Back! ${username}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.blue.withOpacity(0.23),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Ionicons.search_outline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
