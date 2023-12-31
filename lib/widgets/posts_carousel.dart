import 'package:flutter/material.dart';
import 'package:socialmediaapp/models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final PageController? pageController;
   final String? title;
   final List<Post>? posts;

  PostsCarousel({
    this.pageController,
    this.title,
    this.posts,
});
_buildPost(BuildContext context,int index){
  Post? post = posts?[index];
  return AnimatedBuilder(
    animation: pageController ?? ValueNotifier<int>(0),



    builder: (BuildContext context, Widget? widget) {
      double value = 1;
      if (pageController != null && pageController!.position.haveDimensions) {
        value = (pageController!.page! - index)!;
        value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
      }
      return Center(
        child: SizedBox(
          height: Curves.easeInOut.transform(value) * 400,
          child: widget,
        ),
      );

    },
    child: Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(
            color: Colors.black26,
            offset: Offset(0,2),
            blurRadius: 6.0,
          )]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            height: 400,
            width: 300,
            image: AssetImage(post!.imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        left: 10,
        right: 10,
        bottom: 10,
        child: Container(
          padding: EdgeInsets.all(12),
          height: 110,
          decoration: BoxDecoration(
           color: Colors.white54,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(post.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(post.location!,style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
                overflow: TextOverflow.ellipsis,),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(width: 6,),
                      Text(post.likes.toString(),
                      style: TextStyle(
                        fontSize: 18,

                      ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.comment,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 6,),
                      Text(post.comments.toString(),style: TextStyle(
                        fontSize: 18,

                      ),),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )
    ],),
  );
}
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.fromLTRB(20,20,20,10),
          child: Text(
            title!,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts?.length,
            itemBuilder: (BuildContext context,int index){
             return _buildPost(context,index);
            },

          ),
        )
      ],
    )
    ;
  }
}
