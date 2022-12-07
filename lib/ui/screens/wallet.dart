import 'package:flutter/material.dart';
// import 'package:final_app/utils/colors.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor:Color(0xff6D2113),
            title: Text("Wallet",
            style: TextStyle(
              color: Colors.white,
              
            ),
            textAlign: TextAlign.center,
            ),
            // backgroundColor: Colors.white,
            //  Color(0xff6D2113),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20,20),
            child: Column(
              children:<Widget> [
                 Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff6D2113),
                  
                ),
                height: 200,
                // width: 200,
            
                 child: Row(
                    children:<Widget> [
                 
                      // Image(image: NetworkImage('https://s3-alpha-sig.figma.com/img/a816/a302/1441e7083f5d4e2e8c26b0260142c554?Expires=1671408000&Signature=Va-Pu9~gii4kSfj-~Gg-3ZqXdnBYenKE~EkkcdKI-gefgDSFc4W0Uv2sLoYpE5N5JUbwxm1rFB--Z4hoEVwcqaLx3Az0C8O4jF0L1mmTcWg3H~sw9Elj4b3h-FkjzjwUzcTtCQuShdGdn72anQva~3Tq7KFhlyDSjqLI6lONDzKbDDzIKZ7B3aVRpu8CF~mhA8o7caKSTkwOsC7rwQ-bpWx-kS0stHfwedEjmlHMy4YrFYOhhTus09KcwQ0KpuaA2GplXWB0wngkFaCWKgj1KujAoCAFVSEGIDs7QTmZJmF7wm2-aH0VuFW4upbcP7y54WnS~ppxtmASZ7HcDV9lsw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),),
                          // Image()
                      Text("1000",
                      textAlign:TextAlign.right,
                      style: TextStyle(
                      //  fontsize:20,
                     color: Colors.white,
                   
                       
                      ),
                        
                      ),


                      // Text("Helllo"),
                    ],
                   ),
                 ),
            SizedBox(height: 20,),

                 Text("Transtion History",
                 textAlign: TextAlign.left,),
               
              ],
             
            ),
              
            ),
          
          ),
       
     
    );
  }
}
