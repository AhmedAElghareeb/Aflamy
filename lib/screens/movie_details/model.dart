part of 'cubit.dart';

class MovieDetails {
  late final bool adult;
  late final String backdropPath;
  late final BelongsToCollection? belongsToCollection;
  late final num budget;
  late final List<Genres> genres;
  late final String homepage;
  late final int id;
  late final String imdbId;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final num popularity;
  late final String posterPath;
  late final List<ProductionCompanies> productionCompanies;
  late final List<ProductionCountries> productionCountries;
  late final String releaseDate;
  late final num revenue;
  late final int runtime;
  late final List<SpokenLanguages> spokenLanguages;
  late final String status;
  late final String tagline;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final num voteCount;

  MovieDetails.fromJson(Map<String, dynamic> json){
    adult = json['adult'] ?? false;
    backdropPath = "http://image.tmdb.org/t/p/original${json['backdrop_path']}";
    belongsToCollection = json['belongs_to_collection'] == null? null: BelongsToCollection.fromJson(json['belongs_to_collection']);
    budget = json['budget'] ?? 0;
    genres = List.from(json['genres'] ?? []).map((e)=>Genres.fromJson(e)).toList();
    homepage = json['homepage']??"";
    id = json['id']??0;
    imdbId = json['imdb_id']??"";
    originalLanguage = json['original_language']??"";
    originalTitle = json['original_title']??"";
    overview = json['overview']??"";
    popularity = json['popularity']??0;
    posterPath = json['poster_path']==null?"https://cdn-icons-png.flaticon.com/128/7044/7044046.png":"http://image.tmdb.org/t/p/original${json['poster_path']}";
    productionCompanies = List.from(json['production_companies']).map((e)=>ProductionCompanies.fromJson(e)).toList();
    productionCountries = List.from(json['production_countries']).map((e)=>ProductionCountries.fromJson(e)).toList();
    releaseDate = json['release_date']??"";
    revenue = json['revenue']??0;
    runtime = json['runtime']??0;
    spokenLanguages = List.from(json['spoken_languages']).map((e)=>SpokenLanguages.fromJson(e)).toList();
    status = json['status']??"";
    tagline = json['tagline']??"";
    title = json['title']??"";
    video = json['video'];
    voteAverage = json['vote_average']??0.0;
    voteCount = json['vote_count']??0;
  }
}

class BelongsToCollection {
  late final int id;
  late final String name;
  late final String posterPath;
  late final String backdropPath;

  BelongsToCollection.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
    posterPath = json['poster_path']??"";
    backdropPath = json['backdrop_path']??"";
  }
}

class Genres {
  late final int id;
  late final String name;

  Genres.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
  }
}

class ProductionCompanies {
  late final int id;
  late final String? logoPath;
  late final String name;
  late final String originCountry;

  ProductionCompanies.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    logoPath = json['logo_Path']??"";
    name = json['name']??"";
    originCountry = json['origin_country']??"";
  }
}

class ProductionCountries {
  late final String iso_3166_1;
  late final String name;

  ProductionCountries.fromJson(Map<String, dynamic> json){
    iso_3166_1 = json['iso_3166_1']??"";
    name = json['name']??"";
  }
}

class SpokenLanguages {
  late final String englishName;
  late final String iso_639_1;
  late final String name;

  SpokenLanguages.fromJson(Map<String, dynamic> json){
    englishName = json['english_name']??"";
    iso_639_1 = json['iso_639_1']??"";
    name = json['name']??"";
  }
}