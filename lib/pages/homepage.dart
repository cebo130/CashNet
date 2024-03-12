import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // HomePage({required this.context});
  // final BuildContext context;

  @override
  State<HomePage> createState() => _HomePageState();
}

//backgroundColor: Theme.of(context).colorScheme.inversePrimary,
class _HomePageState extends State<HomePage> {
  Color statusColor = Colors.deepPurple[200]!;
  TextEditingController _tAController = TextEditingController();
  TextEditingController _cAController = TextEditingController();
  String _targetAmountText = "";
  String _currentAmountText = "";
  double difference = 0.0;
  bool entered = false;
  bool show = false;
  double percentage = 0;

  @override
  void dispose() {
    _tAController.dispose();
    _cAController.dispose();
    super.dispose();
  }

  void checkControllers() {
    if (_tAController.text.isNotEmpty && _cAController.text.isNotEmpty) {
      setState(() {
        entered = true;
      });
    } else {
      setState(() {
        entered = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(1, 0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                statusColor,
                Theme.of(context).colorScheme.inversePrimary,
              ],
            )),
          )),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Container(
                width: myWidth * 0.52,
                //margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    //bottomLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(190),
                  ),
                  color: statusColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Cash Status",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext _) => HomePage()));
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: myWidth * 0.48,
                height: 45,
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Target amount",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
              Container(
                width: myWidth * 0.48,
                height: 45,
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  //color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: TextField(
                  controller: _tAController,
                  decoration: InputDecoration(
                    hintText: 'Enter amount',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center, // Center the input text
                  onChanged: (value) {
                    setState(() {
                      _targetAmountText = value;
                      checkControllers();
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: myWidth * 0.48,
                height: 45,
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Current amount",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 5,
              // ),
              Container(
                width: myWidth * 0.48,
                height: 45,
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  //color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: TextField(
                  controller: _cAController,
                  decoration: InputDecoration(
                    hintText: 'Current amount',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center, // Center the input text
                  onChanged: (value) {
                    setState(() {
                      _currentAmountText = value;
                      checkControllers();
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (entered)
            GestureDetector(
              child: Container(
                width: myWidth * 0.5,
                height: 45,
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Center(
                  child: Text(
                    "Process",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  difference = double.parse(_targetAmountText) -
                      double.parse(_currentAmountText);
                  percentage = (double.parse(_currentAmountText) /
                          double.parse(_targetAmountText)) *
                      100;
                  _targetAmountText = "";
                  _currentAmountText = "";
                  _cAController.text = "";
                  _tAController.text = "";
                  show = true;
                  if (difference < 0) {
                    statusColor = Colors.red;
                  } else if (difference > 0) {
                    statusColor = Colors.green;
                  } else if (difference == 0) {
                    statusColor = Colors.black;
                  } else {
                    statusColor = Colors.white;
                  }
                });
              },
            ),
          SizedBox(
            height: 10,
          ),
          if (statusColor == Colors.red)
            Text(
              "😭",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          if (statusColor == Colors.green)
            Text(
              "🥳",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          if (show)
            Container(
              width: myWidth * 0.94,
              height: 45,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "My Status",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ),
          if (show)
            Container(
              width: myWidth * 0.94,
              height: 105,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Theme.of(context).colorScheme.inversePrimary,
                // ),
                borderRadius: BorderRadius.only(
                    // topRight: Radius.circular(60),
                    // bottomRight: Radius.circular(60),
                    ),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.inversePrimary,
                    Colors.deepPurple,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "● Gap is : R ${difference}",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "● ${percentage.roundToDouble()} %",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
