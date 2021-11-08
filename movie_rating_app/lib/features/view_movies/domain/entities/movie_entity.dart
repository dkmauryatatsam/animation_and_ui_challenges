class MovieEntity {
  String title;
  String overview;
  String posterPath;
  String voteAverage;
  MovieEntity({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });

  @override
  String toString() {
    return 'MovieEntity(title: $title, overview: $overview, posterPath: $posterPath, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieEntity &&
        other.title == title &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        voteAverage.hashCode;
  }
}
