import 'package:flutter/material.dart';

class GlobalData extends StatelessWidget {
  final Map data;
  GlobalData({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true, //to avoid grid view to expand all the size
        physics: NeverScrollableScrollPhysics(), //to not let it scroll
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio:
            3//height is double the width a good rectangle here) ,
        ),
        children: <Widget>[
          StatusPanel(
            panelTitle: 'CONFIRMED',
            panelColor: Colors.yellow[800],
            textColor: Colors.white,
            count: data['cases'].toString(),
            ),
          StatusPanel(
            panelTitle: 'ACTIVE',
            panelColor: Colors.blue[900],
            textColor: Colors.white,
            count: data['active'].toString(),
           ),
          StatusPanel(
            panelTitle: 'RECOVERED',
            panelColor: Colors.green[800],
            textColor: Colors.white,
            count: data['recovered'].toString(),
          ),

          StatusPanel(
            panelTitle: 'DEATHS',
            panelColor: Colors.red[800],
            textColor: Colors.white,
            count: data['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final String panelTitle;
  final Color textColor;
  final String count;


  StatusPanel(
      {this.count, this.panelColor, this.panelTitle, this.textColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //getting the device width

    return Card(
      elevation: 2.0,
      child: Container(
        decoration:  BoxDecoration(borderRadius: BorderRadius.circular(5),color: panelColor,),
        margin: EdgeInsets.all(7),

        height: 200.0, width: width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                panelTitle,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    fontFamily: 'Poppins-Medium',
                    color: textColor),
              ),
            ),

            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                count,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:27,
                   fontFamily: 'Poppins-Regular',
                    color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
