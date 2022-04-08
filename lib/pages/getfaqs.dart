import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/controllers/company_controller.dart';
import 'package:upm_mii/controllers/faq_controller.dart';
import 'package:upm_mii/models/company.dart';
import 'package:upm_mii/models/faq.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/pages/plans/view_company.dart';
import 'package:expandable/expandable.dart';

class GetFAQ extends StatefulWidget {
  const GetFAQ({Key? key}) : super(key: key);

  @override
  State<GetFAQ> createState() => _GetFAQState();
}

class Data {
  String topics;
  String contents;

  Data(this.topics, this.contents);
}

class _GetFAQState extends State<GetFAQ> {
  @override
  Widget build(BuildContext context) {
    FAQController faqController = FAQController();
    return FutureBuilder(
      future: faqController.getFaqs(),
      builder: (context, AsyncSnapshot<List<FAQ>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const SpinKitDancingSquare(
              color: Color(0xff243E82),
            ),
          );
        } else {
          return Faqs(
            faqs: snapshot.data,
            controller: faqController,
          );
        }
      },
    );
  }
}

class Faqs extends StatefulWidget {
  const Faqs({this.faqs, this.controller, Key? key}) : super(key: key);

  final List<FAQ>? faqs;
  final FAQController? controller;

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  late List<FAQ> faqs = [];
  late FAQController controller;

  @override
  void initState() {
    faqs = widget.faqs!;
    controller = widget.controller!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(children: [
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
        Container(
          decoration: BoxDecoration(
              color: Colors.blue[800],
              border: Border.all(color: Colors.blue.shade800),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TextButton(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              child: Text('Search Topic')),
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
                  child: ListView.builder(
                    itemCount: faqs.length,
                    itemBuilder: (context, index) {
                      return Column(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 242, 242, 242),
                              border: Border.all(
                                  color: Color.fromARGB(255, 242, 242, 242)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: ExpandableNotifier(
                            child: ScrollOnExpand(
                              child: ExpandablePanel(
                                header: Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                    child: Text(
                                      faqs[index].topic!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 102, 102, 102)),
                                    )),
                                collapsed: SizedBox.shrink(),
                                expanded: Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                                    child: Text(
                                      faqs[index].content!,
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
                        )
                      ]);
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  var dataList = [
    Data('Glossary',
        'Insurer : The Life Insurance Company.\n\nBenificiaries : The people receiving the money from the Life Insurance Policy in the case of your death.\n\nLife Insurance Policy : A guarantee the insurer pays a sum of money to named beneficiaries when the insured dies in exchange for the premiums paid by the policyholder during their lifetime.\n\nPremium : The payment made to the Life Insurance Company in exchange for your Life Insurance Policy.\n\nMaturity Benefits :  A lump-sum amount the insurance company pays you after the maturity of the Life Insurance Policy. This means that if your Life Insurance Policy is for a term of 15 years, the Life Insurance Policy matures after 15 years. '),
    Data('What is Life Insurance?',
        'Life insurance is a contract between you and an insurance company. Essentially, in exchange for your premium payments, the insurance company will pay a lump sum known as a death benefit to your beneficiaries after your death. Your beneficiaries can use the money for whatever purpose they choose.'),
    Data('Why is Life Insurance useful?',
        'Life insurance is useful to ensure the financial stability of your family in case you are unable to earn due to an accident or illness. The policy also pays the benefits to your beneficiaries in case of an untoward event. Procuring such coverage ensures that your family can to meet their expenses and sustain their lifestyles even in your absence.'),
    Data('Is Life Insurance necessary?',
        'One of the things to know about life insurance is that while it is not necessary, purchasing a policy is a smart investment decision. This is especially if you have dependents such as spouse, parents, and children. The life plan will provide financial security to your family if you are not around. Moreover, life policies offer several benefits and are a flexible instrument. Some of these include the flexibility of adding riders for greater coverage or withdrawing part of the accumulated corpus to meet expenses such as children’s education or wedding.'),
    Data('How do I decide on the amount of Life Insurance cover I need?',
        'The maturity benefits primarily depend on the premium you pay during the policy term. This amount depends on several factors such as your lifestyle, spending habits, income, expenses, and debt obligations. It is recommended you procure coverage that is approximately between eight-ten times of your annual income.')
  ];
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {},
        )
      ];
  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      );
  @override
  Widget buildResults(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Press Back To Return',
            )
          ],
        ),
      );
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? dataList
        : dataList.where((data) {
            final dataLower = data.topics.toLowerCase();
            final queryLower = query.toLowerCase();
            return dataLower.startsWith(queryLower);
          }).toList();
    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<Data> suggestions) => ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 242, 242),
                border: Border.all(color: Color.fromARGB(255, 242, 242, 242)),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ExpandableNotifier(
              child: ScrollOnExpand(
                child: ExpandablePanel(
                  header: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                      child: Text(
                        suggestion.topics,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 102, 102, 102)),
                      )),
                  collapsed: SizedBox.shrink(),
                  expanded: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                      child: Text(
                        suggestion.contents,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                ),
              ),
            ),
          ),
        ]);
      });
}
