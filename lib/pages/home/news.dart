import 'package:flutter/material.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Newspage extends StatefulWidget {
  const Newspage(
      {Key? key, required this.title, required this.date, required this.url})
      : super(key: key);
  final String title;
  final DateTime date;
  final String url;

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppbar(),
      body: Column(
        children: [
          Newsheader(
            height: height,
            widget: widget,
          ),
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.url,
            ),
          )
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

class Newsheader extends StatelessWidget {
  const Newsheader({
    Key? key,
    required this.height,
    required this.widget,
  }) : super(key: key);

  final double height;
  final Newspage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (1 / 10 * height),
      child: Stack(
        children: [
          Container(
            height: 1 / 10 * height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff243E82),
                  Color(0xff00AAE0),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'News',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${widget.title}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          DateFormat.yMMMd().format(widget.date),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
