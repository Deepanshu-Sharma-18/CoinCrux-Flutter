
class CryptoModel {
  MetaData? metaData;
  Map<String, TimeSeriesDigitalCurrencyDaily>? timeSeriesDigitalCurrencyDaily;

  CryptoModel({
    this.metaData,
    this.timeSeriesDigitalCurrencyDaily,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
    metaData: MetaData.fromJson(json["Meta Data"]),
    timeSeriesDigitalCurrencyDaily: Map.from(json["Time Series (Digital Currency Daily)"]).map((k, v) => MapEntry<String, TimeSeriesDigitalCurrencyDaily>(k, TimeSeriesDigitalCurrencyDaily.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Meta Data": metaData?.toJson(),
    "Time Series (Digital Currency Daily)": Map.from(timeSeriesDigitalCurrencyDaily ?? {}).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class CryptoModelWeekly {
  MetaData? metaData;
  Map<String, TimeSeriesDigitalCurrencyDaily>? timeSeriesDigitalCurrencyWeekly;

  CryptoModelWeekly({
    this.metaData,
    this.timeSeriesDigitalCurrencyWeekly,
  });

  factory CryptoModelWeekly.fromJson(Map<String, dynamic> json) => CryptoModelWeekly(
    metaData: MetaData.fromJson(json["Meta Data"]),
    timeSeriesDigitalCurrencyWeekly: Map.from(json["Time Series (Digital Currency Weekly)"]).map((k, v) => MapEntry<String, TimeSeriesDigitalCurrencyDaily>(k, TimeSeriesDigitalCurrencyDaily.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Meta Data": metaData?.toJson(),
    "Time Series (Digital Currency Weekly)": Map.from(timeSeriesDigitalCurrencyWeekly ?? {}).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class CryptoModelMonthly {
  MetaData? metaData;
  Map<String, TimeSeriesDigitalCurrencyDaily>? timeSeriesDigitalCurrencyMonthly;

  CryptoModelMonthly({
    this.metaData,
    this.timeSeriesDigitalCurrencyMonthly,
  });

  factory CryptoModelMonthly.fromJson(Map<String, dynamic> json) => CryptoModelMonthly(
    metaData: MetaData.fromJson(json["Meta Data"]),
    timeSeriesDigitalCurrencyMonthly: Map.from(json["Time Series (Digital Currency Monthly)"]).map((k, v) => MapEntry<String, TimeSeriesDigitalCurrencyDaily>(k, TimeSeriesDigitalCurrencyDaily.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Meta Data": metaData?.toJson(),
    "Time Series (Digital Currency Monthly)": Map.from(timeSeriesDigitalCurrencyMonthly ?? {}).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}



class MetaData {
  String? the1Information;
  String? the2DigitalCurrencyCode;
  String? the3DigitalCurrencyName;
  String? the4MarketCode;
  String? the5MarketName;
  DateTime? the6LastRefreshed;
  String? the7TimeZone;

  MetaData({
    this.the1Information,
    this.the2DigitalCurrencyCode,
    this.the3DigitalCurrencyName,
    this.the4MarketCode,
    this.the5MarketName,
    this.the6LastRefreshed,
    this.the7TimeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    the1Information: json["1. Information"],
    the2DigitalCurrencyCode: json["2. Digital Currency Code"],
    the3DigitalCurrencyName: json["3. Digital Currency Name"],
    the4MarketCode: json["4. Market Code"],
    the5MarketName: json["5. Market Name"],
    the6LastRefreshed: DateTime.parse(json["6. Last Refreshed"]),
    the7TimeZone: json["7. Time Zone"],
  );

  Map<String, dynamic> toJson() => {
    "1. Information": the1Information,
    "2. Digital Currency Code": the2DigitalCurrencyCode,
    "3. Digital Currency Name": the3DigitalCurrencyName,
    "4. Market Code": the4MarketCode,
    "5. Market Name": the5MarketName,
    "6. Last Refreshed": the6LastRefreshed?.toIso8601String(),
    "7. Time Zone": the7TimeZone,
  };
}

class TimeSeriesDigitalCurrencyDaily {
  String? the1AOpenCny;
  String? the1BOpenUsd;
  String? the2AHighCny;
  String? the2BHighUsd;
  String? the3ALowCny;
  String? the3BLowUsd;
  String? the4ACloseCny;
  String? the4BCloseUsd;
  String? the5Volume;
  String? the6MarketCapUsd;

  TimeSeriesDigitalCurrencyDaily({
    this.the1AOpenCny,
    this.the1BOpenUsd,
    this.the2AHighCny,
    this.the2BHighUsd,
    this.the3ALowCny,
    this.the3BLowUsd,
    this.the4ACloseCny,
    this.the4BCloseUsd,
    this.the5Volume,
    this.the6MarketCapUsd,
  });

  factory TimeSeriesDigitalCurrencyDaily.fromJson(Map<String, dynamic> json) => TimeSeriesDigitalCurrencyDaily(
    the1AOpenCny: json["1a. open (INR)"],
    the1BOpenUsd: json["1b. open (USD)"],
    the2AHighCny: json["2a. high (INR)"],
    the2BHighUsd: json["2b. high (USD)"],
    the3ALowCny: json["3a. low (INR)"],
    the3BLowUsd: json["3b. low (USD)"],
    the4ACloseCny: json["4a. close (INR)"],
    the4BCloseUsd: json["4b. close (USD)"],
    the5Volume: json["5. volume"],
    the6MarketCapUsd: json["6. market cap (USD)"],
  );

  Map<String, dynamic> toJson() => {
    "1a. open (INR)": the1AOpenCny,
    "1b. open (USD)": the1BOpenUsd,
    "2a. high (INR)": the2AHighCny,
    "2b. high (USD)": the2BHighUsd,
    "3a. low (INR)": the3ALowCny,
    "3b. low (USD)": the3BLowUsd,
    "4a. close (INR)": the4ACloseCny,
    "4b. close (USD)": the4BCloseUsd,
    "5. volume": the5Volume,
    "6. market cap (USD)": the6MarketCapUsd,
  };
}
