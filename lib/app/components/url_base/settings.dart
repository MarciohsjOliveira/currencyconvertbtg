class Settings {
  static final Settings _singleton = Settings._internal();

  factory Settings() {
    return _singleton;
  }

  Settings._internal();

  static String baseUrlPrefix = 'http://apilayer.net/api';
  static String apiKey = '762c3d3d8fc6516adbcbb2c89ca1c22f';
}
