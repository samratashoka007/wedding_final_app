import 'package:flutter/material.dart';
import 'package:wedding_final_app/guestroutes/moreevents.dart';
import 'package:wedding_final_app/screens/homescreen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/eventsdata.dart';




class Events extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return EventDetails();
  }
}

class EventDetails extends State<Events>{
  final String apiURL = 'https://flutter-examples.000webhostapp.com/getFlowersList.php';

  Future<List<EventsData>> fetchFlowers() async {

    var response = await http.get(apiURL);

    if (response.statusCode == 200) {

      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<EventsData> listOfFruits = items.map<EventsData>((json) {
        return EventsData.fromJson(json);
      }).toList();

      return listOfFruits;
    }
    else {
      throw Exception('Failed to load data from Server.');
    }
  }

  selectedItem(BuildContext context, String holder) {
  /*  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(holder),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );*/
   /* Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MoreEvents(itemHolder : holder)
        )
    );*/
  }


  Widget build(context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Events'),
      ),
      body: FutureBuilder<List<EventsData>>(
        future: fetchFlowers(),

        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              itemCount: snapshot.data.length,
              itemBuilder: (context, int position)

               {

              return ListView(
              shrinkWrap: false,
              children: snapshot.data
                  .map((data) => Column(children: <Widget>[

                GestureDetector(
                  onTap: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return MoreEvents(position);
                  }));



                  },
                  child: Row(
                      children: [
                        Container(
                            width: 200,
                            height: 100,
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child:
                                Image.network(data.imageUrl,
                                  width: 200, height: 100, fit: BoxFit.cover,))),

                        Flexible(child:
                        Text(data.name,
                            style: TextStyle(fontSize: 18)))
                      ]),
                ),

                Divider(color: Colors.black),

              ],))
                  .toList(),
            );

           /* return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MoreEvents(index);
                      },
                    ),
                  );
                },
              child: Row(
                children: <Widget>[
                  Container(
                    width: 200.0,
                    height: 100.0,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(data.fl),
                    ),
                  )
                ],
              ) ,
            );*/
          },
            );
        /*  return ListView(
            children: snapshot.data
                .map((data) => Column(children: <Widget>[

              GestureDetector(
                onTap: (){

                  selectedItem(context, data.flowerName);



                  },
                child: Row(
                    children: [
                      Container(
                          width: 200,
                          height: 100,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child:
                              Image.network(data.flowerImageURL,
                                width: 200, height: 100, fit: BoxFit.cover,))),

                      Flexible(child:
                      Text(data.flowerName,
                          style: TextStyle(fontSize: 18)))
                    ]),
              ),

              Divider(color: Colors.black),

            ],))
                .toList(),
          );*/
        },
      ),

    );
  }


}