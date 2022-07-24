// ignore_for_file: unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables

class AppUrl {
  //https://api.themoviedb.org/3/movie/popular?api_key=0277cc714ad9100fe38b7f37fdfeb1d9
  //https://api.themoviedb.org/3/movie/550?api_key=0277cc714ad9100fe38b7f37fdfeb1d9
  //https://api.themoviedb.org/3/person/

  static var baseUrl = 'https://reqres.in/';
  static var photoBaseUrl =
      "https://image.tmdb.org/t/p/w500";

  static var loginEndPint = '${baseUrl}api/login';

  static var registerApiEndPoint =
      '${baseUrl}api/register';

  static var moviesBaseUrl =
      'https://api.themoviedb.org/3/movie';

  static var personBaseUrl =
      'https://api.themoviedb.org/3/person';
  static var apiKey =
      '0277cc714ad9100fe38b7f37fdfeb1d9';

  static var moviesPopularMovie =
      '$moviesBaseUrl/popular?api_key=$apiKey';

  static var moviesUpComingMovie =
      '$moviesBaseUrl/upcoming?api_key=$apiKey';

  static var moviesTopRatedMovie =
      '$moviesBaseUrl/top_rated?api_key=$apiKey';

  static var cast = '/credits?api_key=$apiKey';

//https://api.themoviedb.org/3/movie/16/videos?api_key=0277cc714ad9100fe38b7f37fdfeb1d9

  static var movieVideo =
      '/videos?api_key=$apiKey';

//https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=<<api_key>>&language=en-US&page=1

  static var similarMovie =
      '/similar?api_key=$apiKey';

//https://api.themoviedb.org/3/movie/16/reviews?api_key=0277cc714ad9100fe38b7f37fdfeb1d9
  static var reviewMovie =
      '/reviews?api_key=$apiKey';

//https://api.themoviedb.org/3/person/504?api_key=0277cc714ad9100fe38b7f37fdfeb1d9
  static var personDetail = '?api_key=$apiKey';

  //https://api.themoviedb.org/3/person/504/movie_credits?api_key=0277cc714ad9100fe38b7f37fdfeb1d9

  static var movieCredits =
      '/movie_credits?api_key=$apiKey';

  //https://api.themoviedb.org/3/person/504/images?api_key=0277cc714ad9100fe38b7f37fdfeb1d9

  static var personImage =
      '/images?api_key=$apiKey';
}
