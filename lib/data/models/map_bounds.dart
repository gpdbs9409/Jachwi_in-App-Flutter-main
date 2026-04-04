class MapBounds {
  final double southLatitude;
  final double westLongitude;
  final double northLatitude;
  final double eastLongitude;

  MapBounds({
    required this.southLatitude,
    required this.westLongitude,
    required this.northLatitude,
    required this.eastLongitude,
  });

  Map<String, dynamic> toJson() => {
        'southLatitude': southLatitude,
        'westLongitude': westLongitude,
        'northLatitude': northLatitude,
        'eastLongitude': eastLongitude,
      };
}
