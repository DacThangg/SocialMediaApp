import 'package:flutter/material.dart';
import 'package:socialmediaapp/data/data.dart';
import 'package:socialmediaapp/models/user_model.dart';

class FollowingUsers extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.fromLTRB(20,20,20,10),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 80.0,

          child: ListView.builder(
            padding: EdgeInsets.only(left: 10,),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context,int index){
              User user = users[index];
              return  GestureDetector(
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0,2),
                        blurRadius: 6,
                      )],
                      border: Border.all(width: 2,color: Theme.of(context).primaryColor)
                  ),

                  child: ClipOval(
                    child: Image(
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                        image: AssetImage(user.profileImageUrl!)),
                  ),
                ),
              );
            },
            itemCount: users.length,

          ),
        )
      ],);
  }
}
