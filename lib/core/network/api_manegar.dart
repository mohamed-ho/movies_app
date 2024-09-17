class ApiManegar {
  static String baseURLImage = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String imagePath) {
    return "$baseURLImage$imagePath";
  }
}
