// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  double latitude;
  double longitude;
  String timezone;
  Currently currently;
  Minutely minutely;
  Hourly hourly;
  Daily daily;
  Flags flags;
  int offset;

  Weather({
    this.latitude,
    this.longitude,
    this.timezone,
    this.currently,
    this.minutely,
    this.hourly,
    this.daily,
    this.flags,
    this.offset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => new Weather(
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    timezone: json["timezone"] == null ? null : json["timezone"],
    currently: json["currently"] == null ? null : Currently.fromJson(json["currently"]),
    minutely: json["minutely"] == null ? null : Minutely.fromJson(json["minutely"]),
    hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
    daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
    offset: json["offset"] == null ? null : json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "timezone": timezone == null ? null : timezone,
    "currently": currently == null ? null : currently.toJson(),
    "minutely": minutely == null ? null : minutely.toJson(),
    "hourly": hourly == null ? null : hourly.toJson(),
    "daily": daily == null ? null : daily.toJson(),
    "flags": flags == null ? null : flags.toJson(),
    "offset": offset == null ? null : offset,
  };
}

class Currently {
  int time;
  Summary summary;
  Icon icon;
  int nearestStormDistance;
  int nearestStormBearing;
  double precipIntensity;
  double precipProbability;
  double temperature;
  double apparentTemperature;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windBearing;
  double cloudCover;
  int uvIndex;
  double visibility;
  double ozone;
  PrecipType precipType;

  Currently({
    this.time,
    this.summary,
    this.icon,
    this.nearestStormDistance,
    this.nearestStormBearing,
    this.precipIntensity,
    this.precipProbability,
    this.temperature,
    this.apparentTemperature,
    this.dewPoint,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windGust,
    this.windBearing,
    this.cloudCover,
    this.uvIndex,
    this.visibility,
    this.ozone,
    this.precipType,
  });

  factory Currently.fromJson(Map<String, dynamic> json) => new Currently(
    time: json["time"] == null ? null : json["time"],
    summary: json["summary"] == null ? null : summaryValues.map[json["summary"]],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    nearestStormDistance: json["nearestStormDistance"] == null ? null : json["nearestStormDistance"],
    nearestStormBearing: json["nearestStormBearing"] == null ? null : json["nearestStormBearing"],
    precipIntensity: json["precipIntensity"] == null ? null : json["precipIntensity"].toDouble(),
    precipProbability: json["precipProbability"] == null ? null : json["precipProbability"].toDouble(),
    temperature: json["temperature"] == null ? null : json["temperature"].toDouble(),
    apparentTemperature: json["apparentTemperature"] == null ? null : json["apparentTemperature"].toDouble(),
    dewPoint: json["dewPoint"] == null ? null : json["dewPoint"].toDouble(),
    humidity: json["humidity"] == null ? null : json["humidity"].toDouble(),
    pressure: json["pressure"] == null ? null : json["pressure"].toDouble(),
    windSpeed: json["windSpeed"] == null ? null : json["windSpeed"].toDouble(),
    windGust: json["windGust"] == null ? null : json["windGust"].toDouble(),
    windBearing: json["windBearing"] == null ? null : json["windBearing"],
    cloudCover: json["cloudCover"] == null ? null : json["cloudCover"].toDouble(),
    uvIndex: json["uvIndex"] == null ? null : json["uvIndex"],
    visibility: json["visibility"] == null ? null : json["visibility"].toDouble(),
    ozone: json["ozone"] == null ? null : json["ozone"].toDouble(),
    precipType: json["precipType"] == null ? null : precipTypeValues.map[json["precipType"]],
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? null : time,
    "summary": summary == null ? null : summaryValues.reverse[summary],
    "icon": icon == null ? null : iconValues.reverse[icon],
    "nearestStormDistance": nearestStormDistance == null ? null : nearestStormDistance,
    "nearestStormBearing": nearestStormBearing == null ? null : nearestStormBearing,
    "precipIntensity": precipIntensity == null ? null : precipIntensity,
    "precipProbability": precipProbability == null ? null : precipProbability,
    "temperature": temperature == null ? null : temperature,
    "apparentTemperature": apparentTemperature == null ? null : apparentTemperature,
    "dewPoint": dewPoint == null ? null : dewPoint,
    "humidity": humidity == null ? null : humidity,
    "pressure": pressure == null ? null : pressure,
    "windSpeed": windSpeed == null ? null : windSpeed,
    "windGust": windGust == null ? null : windGust,
    "windBearing": windBearing == null ? null : windBearing,
    "cloudCover": cloudCover == null ? null : cloudCover,
    "uvIndex": uvIndex == null ? null : uvIndex,
    "visibility": visibility == null ? null : visibility,
    "ozone": ozone == null ? null : ozone,
    "precipType": precipType == null ? null : precipTypeValues.reverse[precipType],
  };
}

enum Icon { PARTLY_CLOUDY_NIGHT, CLEAR_NIGHT, CLEAR_DAY, PARTLY_CLOUDY_DAY }

final iconValues = new EnumValues({
  "clear-day": Icon.CLEAR_DAY,
  "clear-night": Icon.CLEAR_NIGHT,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT
});

enum PrecipType { RAIN }

final precipTypeValues = new EnumValues({
  "rain": PrecipType.RAIN
});

enum Summary { PARTLY_CLOUDY, CLEAR }

final summaryValues = new EnumValues({
  "Clear": Summary.CLEAR,
  "Partly Cloudy": Summary.PARTLY_CLOUDY
});

class Daily {
  String summary;
  Icon icon;
  List<DailyDatum> data;

  Daily({
    this.summary,
    this.icon,
    this.data,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => new Daily(
    summary: json["summary"] == null ? null : json["summary"],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    data: json["data"] == null ? null : new List<DailyDatum>.from(json["data"].map((x) => DailyDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary == null ? null : summary,
    "icon": icon == null ? null : iconValues.reverse[icon],
    "data": data == null ? null : new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DailyDatum {
  int time;
  String summary;
  Icon icon;
  int sunriseTime;
  int sunsetTime;
  double moonPhase;
  double precipIntensity;
  double precipIntensityMax;
  int precipIntensityMaxTime;
  double precipProbability;
  PrecipType precipType;
  double temperatureHigh;
  int temperatureHighTime;
  double temperatureLow;
  int temperatureLowTime;
  double apparentTemperatureHigh;
  int apparentTemperatureHighTime;
  double apparentTemperatureLow;
  int apparentTemperatureLowTime;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windGustTime;
  int windBearing;
  double cloudCover;
  int uvIndex;
  int uvIndexTime;
  double visibility;
  double ozone;
  double temperatureMin;
  int temperatureMinTime;
  double temperatureMax;
  int temperatureMaxTime;
  double apparentTemperatureMin;
  int apparentTemperatureMinTime;
  double apparentTemperatureMax;
  int apparentTemperatureMaxTime;

  DailyDatum({
    this.time,
    this.summary,
    this.icon,
    this.sunriseTime,
    this.sunsetTime,
    this.moonPhase,
    this.precipIntensity,
    this.precipIntensityMax,
    this.precipIntensityMaxTime,
    this.precipProbability,
    this.precipType,
    this.temperatureHigh,
    this.temperatureHighTime,
    this.temperatureLow,
    this.temperatureLowTime,
    this.apparentTemperatureHigh,
    this.apparentTemperatureHighTime,
    this.apparentTemperatureLow,
    this.apparentTemperatureLowTime,
    this.dewPoint,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windGust,
    this.windGustTime,
    this.windBearing,
    this.cloudCover,
    this.uvIndex,
    this.uvIndexTime,
    this.visibility,
    this.ozone,
    this.temperatureMin,
    this.temperatureMinTime,
    this.temperatureMax,
    this.temperatureMaxTime,
    this.apparentTemperatureMin,
    this.apparentTemperatureMinTime,
    this.apparentTemperatureMax,
    this.apparentTemperatureMaxTime,
  });

  factory DailyDatum.fromJson(Map<String, dynamic> json) => new DailyDatum(
    time: json["time"] == null ? null : json["time"],
    summary: json["summary"] == null ? null : json["summary"],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    sunriseTime: json["sunriseTime"] == null ? null : json["sunriseTime"],
    sunsetTime: json["sunsetTime"] == null ? null : json["sunsetTime"],
    moonPhase: json["moonPhase"] == null ? null : json["moonPhase"].toDouble(),
    precipIntensity: json["precipIntensity"] == null ? null : json["precipIntensity"].toDouble(),
    precipIntensityMax: json["precipIntensityMax"] == null ? null : json["precipIntensityMax"].toDouble(),
    precipIntensityMaxTime: json["precipIntensityMaxTime"] == null ? null : json["precipIntensityMaxTime"],
    precipProbability: json["precipProbability"] == null ? null : json["precipProbability"].toDouble(),
    precipType: json["precipType"] == null ? null : precipTypeValues.map[json["precipType"]],
    temperatureHigh: json["temperatureHigh"] == null ? null : json["temperatureHigh"].toDouble(),
    temperatureHighTime: json["temperatureHighTime"] == null ? null : json["temperatureHighTime"],
    temperatureLow: json["temperatureLow"] == null ? null : json["temperatureLow"].toDouble(),
    temperatureLowTime: json["temperatureLowTime"] == null ? null : json["temperatureLowTime"],
    apparentTemperatureHigh: json["apparentTemperatureHigh"] == null ? null : json["apparentTemperatureHigh"].toDouble(),
    apparentTemperatureHighTime: json["apparentTemperatureHighTime"] == null ? null : json["apparentTemperatureHighTime"],
    apparentTemperatureLow: json["apparentTemperatureLow"] == null ? null : json["apparentTemperatureLow"].toDouble(),
    apparentTemperatureLowTime: json["apparentTemperatureLowTime"] == null ? null : json["apparentTemperatureLowTime"],
    dewPoint: json["dewPoint"] == null ? null : json["dewPoint"].toDouble(),
    humidity: json["humidity"] == null ? null : json["humidity"].toDouble(),
    pressure: json["pressure"] == null ? null : json["pressure"].toDouble(),
    windSpeed: json["windSpeed"] == null ? null : json["windSpeed"].toDouble(),
    windGust: json["windGust"] == null ? null : json["windGust"].toDouble(),
    windGustTime: json["windGustTime"] == null ? null : json["windGustTime"],
    windBearing: json["windBearing"] == null ? null : json["windBearing"],
    cloudCover: json["cloudCover"] == null ? null : json["cloudCover"].toDouble(),
    uvIndex: json["uvIndex"] == null ? null : json["uvIndex"],
    uvIndexTime: json["uvIndexTime"] == null ? null : json["uvIndexTime"],
    visibility: json["visibility"] == null ? null : json["visibility"].toDouble(),
    ozone: json["ozone"] == null ? null : json["ozone"].toDouble(),
    temperatureMin: json["temperatureMin"] == null ? null : json["temperatureMin"].toDouble(),
    temperatureMinTime: json["temperatureMinTime"] == null ? null : json["temperatureMinTime"],
    temperatureMax: json["temperatureMax"] == null ? null : json["temperatureMax"].toDouble(),
    temperatureMaxTime: json["temperatureMaxTime"] == null ? null : json["temperatureMaxTime"],
    apparentTemperatureMin: json["apparentTemperatureMin"] == null ? null : json["apparentTemperatureMin"].toDouble(),
    apparentTemperatureMinTime: json["apparentTemperatureMinTime"] == null ? null : json["apparentTemperatureMinTime"],
    apparentTemperatureMax: json["apparentTemperatureMax"] == null ? null : json["apparentTemperatureMax"].toDouble(),
    apparentTemperatureMaxTime: json["apparentTemperatureMaxTime"] == null ? null : json["apparentTemperatureMaxTime"],
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? null : time,
    "summary": summary == null ? null : summary,
    "icon": icon == null ? null : iconValues.reverse[icon],
    "sunriseTime": sunriseTime == null ? null : sunriseTime,
    "sunsetTime": sunsetTime == null ? null : sunsetTime,
    "moonPhase": moonPhase == null ? null : moonPhase,
    "precipIntensity": precipIntensity == null ? null : precipIntensity,
    "precipIntensityMax": precipIntensityMax == null ? null : precipIntensityMax,
    "precipIntensityMaxTime": precipIntensityMaxTime == null ? null : precipIntensityMaxTime,
    "precipProbability": precipProbability == null ? null : precipProbability,
    "precipType": precipType == null ? null : precipTypeValues.reverse[precipType],
    "temperatureHigh": temperatureHigh == null ? null : temperatureHigh,
    "temperatureHighTime": temperatureHighTime == null ? null : temperatureHighTime,
    "temperatureLow": temperatureLow == null ? null : temperatureLow,
    "temperatureLowTime": temperatureLowTime == null ? null : temperatureLowTime,
    "apparentTemperatureHigh": apparentTemperatureHigh == null ? null : apparentTemperatureHigh,
    "apparentTemperatureHighTime": apparentTemperatureHighTime == null ? null : apparentTemperatureHighTime,
    "apparentTemperatureLow": apparentTemperatureLow == null ? null : apparentTemperatureLow,
    "apparentTemperatureLowTime": apparentTemperatureLowTime == null ? null : apparentTemperatureLowTime,
    "dewPoint": dewPoint == null ? null : dewPoint,
    "humidity": humidity == null ? null : humidity,
    "pressure": pressure == null ? null : pressure,
    "windSpeed": windSpeed == null ? null : windSpeed,
    "windGust": windGust == null ? null : windGust,
    "windGustTime": windGustTime == null ? null : windGustTime,
    "windBearing": windBearing == null ? null : windBearing,
    "cloudCover": cloudCover == null ? null : cloudCover,
    "uvIndex": uvIndex == null ? null : uvIndex,
    "uvIndexTime": uvIndexTime == null ? null : uvIndexTime,
    "visibility": visibility == null ? null : visibility,
    "ozone": ozone == null ? null : ozone,
    "temperatureMin": temperatureMin == null ? null : temperatureMin,
    "temperatureMinTime": temperatureMinTime == null ? null : temperatureMinTime,
    "temperatureMax": temperatureMax == null ? null : temperatureMax,
    "temperatureMaxTime": temperatureMaxTime == null ? null : temperatureMaxTime,
    "apparentTemperatureMin": apparentTemperatureMin == null ? null : apparentTemperatureMin,
    "apparentTemperatureMinTime": apparentTemperatureMinTime == null ? null : apparentTemperatureMinTime,
    "apparentTemperatureMax": apparentTemperatureMax == null ? null : apparentTemperatureMax,
    "apparentTemperatureMaxTime": apparentTemperatureMaxTime == null ? null : apparentTemperatureMaxTime,
  };
}

class Flags {
  List<String> sources;
  double nearestStation;
  String units;

  Flags({
    this.sources,
    this.nearestStation,
    this.units,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => new Flags(
    sources: json["sources"] == null ? null : new List<String>.from(json["sources"].map((x) => x)),
    nearestStation: json["nearest-station"] == null ? null : json["nearest-station"].toDouble(),
    units: json["units"] == null ? null : json["units"],
  );

  Map<String, dynamic> toJson() => {
    "sources": sources == null ? null : new List<dynamic>.from(sources.map((x) => x)),
    "nearest-station": nearestStation == null ? null : nearestStation,
    "units": units == null ? null : units,
  };
}

class Hourly {
  String summary;
  Icon icon;
  List<Currently> data;

  Hourly({
    this.summary,
    this.icon,
    this.data,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => new Hourly(
    summary: json["summary"] == null ? null : json["summary"],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    data: json["data"] == null ? null : new List<Currently>.from(json["data"].map((x) => Currently.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary == null ? null : summary,
    "icon": icon == null ? null : iconValues.reverse[icon],
    "data": data == null ? null : new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Minutely {
  String summary;
  Icon icon;
  List<MinutelyDatum> data;

  Minutely({
    this.summary,
    this.icon,
    this.data,
  });

  factory Minutely.fromJson(Map<String, dynamic> json) => new Minutely(
    summary: json["summary"] == null ? null : json["summary"],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    data: json["data"] == null ? null : new List<MinutelyDatum>.from(json["data"].map((x) => MinutelyDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary == null ? null : summary,
    "icon": icon == null ? null : iconValues.reverse[icon],
    "data": data == null ? null : new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MinutelyDatum {
  int time;
  int precipIntensity;
  int precipProbability;

  MinutelyDatum({
    this.time,
    this.precipIntensity,
    this.precipProbability,
  });

  factory MinutelyDatum.fromJson(Map<String, dynamic> json) => new MinutelyDatum(
    time: json["time"] == null ? null : json["time"],
    precipIntensity: json["precipIntensity"] == null ? null : json["precipIntensity"],
    precipProbability: json["precipProbability"] == null ? null : json["precipProbability"],
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? null : time,
    "precipIntensity": precipIntensity == null ? null : precipIntensity,
    "precipProbability": precipProbability == null ? null : precipProbability,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
