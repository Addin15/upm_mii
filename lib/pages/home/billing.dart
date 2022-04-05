import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';

class Billing extends StatefulWidget {
  const Billing({Key? key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppbar(),
      body: Column(
        children: [
          BillAmount(height: height),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.blue[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Pay Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            200,
                            0,
                            0,
                            0,
                          ),
                          child: Icon(
                            Icons.credit_card_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Recent Billings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.black,
              controller: _tabController,
              indicatorColor: Colors.black,
              tabs: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'All',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Medical',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Property',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Education',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Motor',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                medical(),
                Text("try"),
                Text("try"),
                Text("try"),
                Text("try"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.primary,
    );
  }
}

Widget medical() {
  return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/zurich.png',
                  height: 100,
                  width: 100,
                ),
                Text(
                  "Zurich Valuecare",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            )
          ],
        );
      });
}

class BillAmount extends StatelessWidget {
  const BillAmount({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Billing',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Total Amount Due",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      '10 April 2022',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
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
                height: 80,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Text(
                        "Amount Due",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 12, 0, 0),
                      child: Text(
                        "RM81.00",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
