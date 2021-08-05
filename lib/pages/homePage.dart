import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String data =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: size.height * 0.4,
              child: Image.network(
                  "https://shepherdtraveller.com/wp-content/uploads/2021/04/oeschinen-lake-oeschinensee-swiss-lakes-1024x683.jpg"),
              width: size.width,
            ),
            SetText(),
            SetButtons(),
            Padding(padding: EdgeInsets.all(25), child: Text(data)),
          ]),
        ),
      ),
    );
  }
}

class SetText extends StatefulWidget {
  const SetText({Key? key}) : super(key: key);

  @override
  _SetTextState createState() => _SetTextState();
}

class _SetTextState extends State<SetText> {
  bool isFilled = true;
  int count = 41;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("oeschinen lake campground",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Kindersteg, Switzerland",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          isFilled
              ? IconButton(
                  icon: Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      isFilled = false;
                      count--;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.star_outline,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      isFilled = true;
                      count++;
                    });
                  },
                ),

          Text(
            count.toString(),
            style: TextStyle(fontSize: 15, color: Colors.red),
          )

          //now for star
        ],
      ),
    );
  }
}

class SetButtons extends StatelessWidget {
  const SetButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SetColumn(selIcon: Icons.phone, content: "CALL"),
        SetColumn(selIcon: Icons.near_me, content: "ROUTE"),
        SetColumn(selIcon: Icons.share, content: "SHARE")
      ],
    );
  }
}

class SetColumn extends StatelessWidget {
  final IconData selIcon;

  final String content;

  const SetColumn({Key? key, required this.selIcon, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              selIcon,
              color: Colors.blue,
            )),
        Text(
          content,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
