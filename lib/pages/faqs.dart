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
              SizedBox(
                height: 395,
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 242, 242),
                          border: Border.all(
                              color: Color.fromARGB(255, 242, 242, 242)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ExpandableNotifier(
                        child: ScrollOnExpand(
                          child: ExpandablePanel(
                            header: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'Glossary',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 102, 102, 102)),
                                )),
                            collapsed: SizedBox.shrink(),
                            expanded: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'Insurer : The Life Insurance Company.\n\nBenificiaries : The people receiving the money from the Life Insurance Policy in the case of your death.\n\nLife Insurance Policy : A guarantee the insurer pays a sum of money to named beneficiaries when the insured dies in exchange for the premiums paid by the policyholder during their lifetime.\n\nPremium : The payment made to the Life Insurance Company in exchange for your Life Insurance Policy.\n\nMaturity Benefits :  A lump-sum amount the insurance company pays you after the maturity of the Life Insurance Policy. This means that if your Life Insurance Policy is for a term of 15 years, the Life Insurance Policy matures after 15 years. ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 242, 242),
                          border: Border.all(
                              color: Color.fromARGB(255, 242, 242, 242)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ExpandableNotifier(
                        child: ScrollOnExpand(
                          child: ExpandablePanel(
                            header: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'What is Life Insurance?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 102, 102, 102)),
                                )),
                            collapsed: SizedBox.shrink(),
                            expanded: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'Life insurance is a contract between you and an insurance company. Essentially, in exchange for your premium payments, the insurance company will pay a lump sum known as a death benefit to your beneficiaries after your death. Your beneficiaries can use the money for whatever purpose they choose.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 242, 242),
                          border: Border.all(
                              color: Color.fromARGB(255, 242, 242, 242)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ExpandableNotifier(
                        child: ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            header: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'Why is Life Insurance useful?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 102, 102, 102)),
                                )),
                            collapsed: SizedBox.shrink(),
                            expanded: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'Life cover is useful to ensure the financial stability of your family in case you are unable to earn due to an accident or illness. The policy also pays the benefits to your beneficiaries in case of an untoward event. Procuring such coverage ensures that your family can to meet their expenses and sustain their lifestyles even in your absence.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 242, 242),
                          border: Border.all(
                              color: Color.fromARGB(255, 242, 242, 242)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ExpandableNotifier(
                        child: ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            header: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'Is Life Insurance necessary?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 102, 102, 102)),
                                )),
                            collapsed: SizedBox.shrink(),
                            expanded: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'One of the things to know about life insurance is that while it is not necessary, purchasing a policy is a smart investment decision. This is especially if you have dependents such as spouse, parents, and children. The life plan will provide financial security to your family if you are not around. Moreover, life policies offer several benefits and are a flexible instrument. Some of these include the flexibility of adding riders for greater coverage or withdrawing part of the accumulated corpus to meet expenses such as children’s education or wedding.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 242, 242),
                          border: Border.all(
                              color: Color.fromARGB(255, 242, 242, 242)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ExpandableNotifier(
                        child: ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            header: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'How do I decide on the amount of Life Insurance cover I need?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 102, 102, 102)),
                                )),
                            collapsed: SizedBox.shrink(),
                            expanded: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                child: Text(
                                  'The maturity benefits primarily depend on the premium you pay during the policy term. This amount depends on several factors such as your lifestyle, spending habits, income, expenses, and debt obligations. It is recommended you procure coverage that is approximately between eight-ten times of your annual income.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
