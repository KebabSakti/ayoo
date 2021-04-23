import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = [
      ChatModel(
        name: 'Tom Cruise',
        url:
            'https://c4.wallpaperflare.com/wallpaper/692/291/745/best-actor-tom-cruise-face-photo-wallpaper-preview.jpg',
      ),
      ChatModel(
        name: 'Ryan Gosling',
        url:
            'https://www.businessinsider.in/thumb/msid-77618469,width-600,resizemode-4,imgsize-172377/tech/news/an-ai-powered-photo-editing-service-turned-a-blurry-spot-in-an-image-into-ryan-goslings-face/img5f3bf128a3eafa001de06b79.jpg',
      ),
      ChatModel(
        name: 'Pak Eko',
        url:
            'http://static.demilked.com/wp-content/uploads/2015/08/celebrity-actor-faces-combined-face-morph-pedro-berg-johnsen-thatnordicguy-1.jpg',
      ),
      ChatModel(
        name: 'Pak RT',
        url:
            'https://i.pinimg.com/originals/d2/79/38/d27938d36289f8a12308ee8bde62404b.jpg',
      ),
      ChatModel(
        name: 'John Snow',
        url:
            'https://www.nme.com/wp-content/uploads/2016/09/GettyImages-468057150.jpg',
      ),
      ChatModel(
        name: 'Thor',
        url:
            'https://fastly.syfy.com/sites/syfy/files/styles/1200x680/public/2019/04/thor-ragnarok-lightning-1200x800.jpg?offset-x=0&offset-y=0',
      ),
      ChatModel(
        name: 'Hulk',
        url:
            'https://i.pinimg.com/originals/58/1e/31/581e311dd463daa672a2edbf003c0d3d.jpg',
      ),
      ChatModel(
        name: 'Iron Man',
        url:
            'https://lh3.googleusercontent.com/proxy/WEn8jugOTY6LeqEbha6gfw46GejWqB_B7MQTgN1LD3uOW0O_OqStUulXofdLkvZHk2sHUVLlDb4Vhsl-p9-pJZLDdeE5MMTufYRcMyaSmaID8k2SMkSO',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Chat',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          return Ink(
            color: Colors.white,
            child: ListTile(
              onTap: () {},
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey[100],
                      child: CachedNetworkImage(
                        imageUrl: chats[index].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                chats[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet feugiat nulla.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.angleRight,
                    color: Colors.grey[600],
                    size: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatModel {
  String name;
  String url;

  ChatModel({this.name, this.url});
}
