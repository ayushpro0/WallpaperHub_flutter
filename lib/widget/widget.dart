import 'package:flutter/material.dart';
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:wallpaper_hub/views/image_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Wallpaper", style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),),
      Text("Hub",style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),)
  ],
  );
}

Widget wallpaperList({required List<WallpaperModel> wallpapers, context})
{
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(imgUrl: wallpaper.src.portrait,)));},

          child: Hero(tag: wallpaper.src.portrait,
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)
              ),
            ),
          ),
        ),
        );
    }).toList(),
    ),
  );
}