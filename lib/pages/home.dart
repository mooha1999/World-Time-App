import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map passedData = {};

  @override
  Widget build(BuildContext context) {
    passedData = passedData.isNotEmpty? passedData : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = passedData['isDayTime']?'day.png':'night.png';
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result['location']!=passedData['location']) {
                      setState(() {
                        passedData = {
                          'time': result['time'],
                          'flag': result['flag'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                        };
                      });
                    }
                  },
                  icon: const Icon(Icons.edit_location,color: Colors.grey),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      passedData['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0,),
                Text(
                  passedData['time'],
                  style: const TextStyle(fontSize: 66.0,color: Colors.white),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
