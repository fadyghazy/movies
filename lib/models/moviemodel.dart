class Movie{

  String backdrop_path;
  num id;
  String original_title;
  String overview;
  num popularity;
  String poster_path;
  String title;
  num vote_average;




  Map<String, dynamic> toMap() {
    return {
      'backdrop_path': this.backdrop_path,
      'id': this.id,
      'original_title': this.original_title,
      'overview': this.overview,
      'popularity': this.popularity,
      'poster_path': this.poster_path,
      'title': this.title,
      'vote_average': this.vote_average,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      backdrop_path: map['backdrop_path'] as String,
      id: map['id'] as num,
      original_title: map['original_title'] as String,
      overview: map['overview'] as String,
      popularity: map['popularity'] as num,
      poster_path: map['poster_path'] as String,
      title: map['title'] as String,
      vote_average: map['vote_average'] as double,

    );
  }

  Movie({
    required this.backdrop_path,
    required  this.id,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.title,
    required  this.vote_average,

  });
}