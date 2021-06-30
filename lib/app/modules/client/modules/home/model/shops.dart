class Shops {
  int id = 1;
  String name = "teste";
  double valueDelivery = 05;
  double distanceKm = 12;
  String image =
      "https://1.bp.blogspot.com/-mydoVANMRDw/Xw3aQXrDjaI/AAAAAAAAEk0/tSUMBTRX-60owDFmOtFaYjMOktKAVpFMQCLcBGAsYHQ/s1600/produtos%252Bflorestais%252Bn%25C3%25A3o%252Bmadeireiros%252Bcentral%252Bflorestal.png";

  String imageBackground =
      "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  static Shops fromMap(dynamic map) {
    return Shops();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'valueDelivery': valueDelivery,
      'distanceKm': distanceKm,
      'image': image,
      'imageBackground': imageBackground,
    };
  }
}
