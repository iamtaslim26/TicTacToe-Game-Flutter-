import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //TODO: Linkup the images

  AssetImage cross=AssetImage("images/cross.png");
  AssetImage circle=AssetImage("images/circle.png");
  AssetImage edit=AssetImage("images/edit.png");

  bool isCross=true;    // alternative work cross and circle
  String message;       // It will print the winner
  List<String>gamestate;


  //TODO: Initialize the state of box


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {

      this.gamestate=
      [

        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",


      ];

      this.message="";


    });
  }


  //TODO:Play game method

  playGame(int index){

    if(this.gamestate[index]=="empty"){

      setState(() {

        if(this.isCross){

          this.gamestate[index]="cross";
          this.isCross=false;
        }
        else{

          this.gamestate[index]="circle";
          this.isCross=true;
        }
       // this.isCross=!this.isCross;
        this.CheckWin();

      });



    }

  }




  //TODO:Reset Game method

  resetGame(){

    setState(() {

      this.gamestate=

          [

            "empty",
            "empty",
            "empty",
            "empty",
            "empty",
            "empty",
            "empty",
            "empty",
            "empty",


          ];

      this.message="";



    });
  }

  //TODO: get Image Method

   AssetImage getImage(String value){

    switch(value){

      case("empty"):
        return edit;
        break;

      case("cross"):
        return cross;
        break;

      case("circle"):
        return circle;
        break;
    }


  }

  //TODO: Winnig Logic

  CheckWin(){

  if(gamestate[0]!='empty' && gamestate[0]==gamestate[1]  && gamestate[1]==gamestate[2]){

    setState(() {

      this.message='${gamestate[0] } Wins';

    });

  }

  else if(gamestate[3]!='empty' && gamestate[3]==gamestate[4]  && gamestate[4]==gamestate[5]){

    setState(() {

      this.message='${gamestate[3] } Wins';

    });
  }

  else if(gamestate[6]!='empty' && gamestate[6]==gamestate[7]  && gamestate[7]==gamestate[8]){

    setState(() {

      this.message='${gamestate[6] } Wins';
    });

  }
  else if(gamestate[0]!='empty' && gamestate[0]==gamestate[3]  && gamestate[3]==gamestate[6]){
    setState(() {

      this.message='${gamestate[0]}  Wins';
    });

  }


  else if(gamestate[1]!='empty' && gamestate[1]==gamestate[4]  && gamestate[4]==gamestate[7]){
    setState(() {

      this.message='${gamestate[1]}  Wins';
    });

  }

  else if(gamestate[2]!='empty' && gamestate[2]==gamestate[5]  && gamestate[5]==gamestate[8]){
    setState(() {

      this.message='${gamestate[2]}  Wins';
    });

  }

  else if(gamestate[0]!='empty' && gamestate[0]==gamestate[4]  && gamestate[4]==gamestate[8]){
    setState(() {

      this.message='${gamestate[0]}  Wins';
    });

  }

  else if(gamestate[2]!='empty' && gamestate[2]==gamestate[4]  && gamestate[4]==gamestate[6]){
    setState(() {

      this.message='${gamestate[0]}  Wins';
    });

  }

  else if(!gamestate.contains("empty")){

    setState(() {

      this.message='Game Draw';
    });


  }


  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(

        title: new Text("Tic Tac Toe"),
      ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[


          Expanded(
            
            
            child: GridView.builder(

              padding: EdgeInsets.all(20.0),
              
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,


                  ),

                  itemCount: this.gamestate.length,
          
                 itemBuilder: (context, i)=>SizedBox(

                   width: 100.0,
                   height: 100.0,


                   child: MaterialButton(


                     onPressed:(){this.playGame(i);
                     },



                     child: Image(

                        image: this.getImage(this.gamestate[i])),
                     
                     ),
                     ),
                 ),

              
                
              
            ),

          Container(

            padding: EdgeInsets.all(20.0),
            child: Text(this.message,

              style: TextStyle(


                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),

            ),
          ),

          MaterialButton(
              onPressed: (){

                this.resetGame();
              },

            color: Colors.purple,
            textColor: Colors.white,
            child: Text("Reset Game",
              style: TextStyle(fontSize: 20.0),
            ),


            minWidth: 300.0,
            height: 50.0,




          )

        ],

      ),
      
    );
  }
}

