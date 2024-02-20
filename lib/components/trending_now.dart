import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:anime_ku/components/anime_card.dart';
import 'package:anime_ku/components/text.dart';
import 'package:flutter/material.dart';

class Anime {
  String malId;
  String title;
  String imageUrl;

  Anime({
    required this.malId,
    required this.title,
    required this.imageUrl,
  });

  factory Anime.createAnime(Map<String, dynamic> object) {
    return Anime(
      malId: object['mal_id'].toString(),
      title: object['titles'][0]['title'],
      imageUrl: object['images']['jpg']['image_url'],
    );
  }

  static Future<List<Anime>> getAnime() async {
    String url = 'https://api.jikan.moe/v4/seasons/now';
    var response = await http.get(Uri.parse(url));
    var jsonObject = json.decode(response.body);
    List<dynamic> listAnime = (jsonObject as Map<String, dynamic>)['data'];

    List<Anime> anime = [];
    for (int i = 0; i < 5; i++) {
      anime.add(Anime.createAnime(listAnime[i]));
    }
    return anime;
  }
}

class TrendingNow extends StatefulWidget {
  const TrendingNow({
    super.key,
  });

  @override
  State<TrendingNow> createState() => _TrendingNowState();
}

class _TrendingNowState extends State<TrendingNow> {
  late Future<List<Anime>> futureAnime;

  @override
  void initState() {
    super.initState();
    futureAnime = Anime.getAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Trending Now',
          fontWeight: FontWeight.bold,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FutureBuilder<List<Anime>>(
                future: futureAnime,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: snapshot.data!
                          .map((anime) => AnimeCard(
                                animeName: anime.title,
                                animeImage: anime.imageUrl,
                              ))
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return TextWidget(
                      text: '${snapshot.error}',
                    );
                  }
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
