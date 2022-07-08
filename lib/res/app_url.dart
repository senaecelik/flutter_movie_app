class AppUrl {
  //https://api.themoviedb.org/3/movie/popular?api_key=0277cc714ad9100fe38b7f37fdfeb1d9
  //https://api.themoviedb.org/3/movie/550?api_key=0277cc714ad9100fe38b7f37fdfeb1d9

  static var baseUrl = 'https://reqres.in/';

  static var loginEndPint = '${baseUrl}api/login';

  static var registerApiEndPoint =
      '${baseUrl}api/register';

  static var moviesBaseUrl =
      'https://api.themoviedb.org/3/movie';

  static var apiKey =
      '0277cc714ad9100fe38b7f37fdfeb1d9';

  static var moviesPopularMovie =
      '$moviesBaseUrl/popular?api_key=$apiKey';

  static var moviesUpComingMovie =
      '$moviesBaseUrl/upcoming?api_key=$apiKey';

  static var moviesTopRatedMovie =
      '$moviesBaseUrl/top_rated?api_key=$apiKey';
      
}
