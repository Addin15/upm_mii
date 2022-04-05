import 'package:flutter/material.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:expandable/expandable.dart';

// ignore_for_file: prefer_const_constructors
class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(children: [
      Container(
          child: Container(
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
            SizedBox(
              height: 10,
            ),
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ) //replace,
          ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        decoration: Style.searchStyle(hintText: 'Search keywords'),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: ExpandableTheme(
          data: ExpandableThemeData(
              iconColor: Color.fromARGB(255, 102, 102, 102),
              animationDuration: const Duration(milliseconds: 500)),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 242, 242),
                    border:
                        Border.all(color: Color.fromARGB(255, 242, 242, 242)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ExpandablePanel(
                  header: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                      child: Text(
                        'What is Life Insurance?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 102, 102, 102)),
                      )),
                  collapsed: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                      child: Text(
                        'Life insurance is a contract between you and an insurance company. Essentially, in exchange for your premium payments, the insurance company will pay a lump sum known as a death benefit to your beneficiaries after your death. Your beneficiaries can use the money for whatever purpose they choose.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                  expanded: SizedBox.shrink(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 242, 242),
                    border:
                        Border.all(color: Color.fromARGB(255, 242, 242, 242)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ExpandablePanel(
                  header: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                      child: Text(
                        'Why is life insurance useful?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 102, 102, 102)),
                      )),
                  collapsed: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                      child: Text(
                        'Life cover is useful to ensure the financial stability of your family in case you are unable to earn due to an accident or illness. The policy also pays the benefits to your beneficiaries in case of an untoward event. Procuring such coverage ensures that your family can to meet their expenses and sustain their lifestyles even in your absence.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                  expanded: SizedBox.shrink(),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
