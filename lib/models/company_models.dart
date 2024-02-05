class CompanyModels {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyModels({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory CompanyModels.fromJson(Map<String, dynamic> json) => CompanyModels(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );
}