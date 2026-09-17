class WeatherDataModel {
  WeatherDataModel({
    this.id=0,
    this. main='',
    this. description='',
    this. icon='',

});
  final int id;
  final String main;
  final String description;
  final String icon;

  factory WeatherDataModel.fromJson(Map<String, dynamic> data){
    return WeatherDataModel(
        id: data ['id']?? 0,
        main: data ['main']?? '',
        description: data ['description']?? '',
        icon: data['icon']??'',
    );
  }


  Map<String,dynamic> toJson(){
    return{
      'id': id,
      'main' : main,
      ' description':  description,
      'icon': icon,

    };
  }
  static List<WeatherDataModel> fromJsonList(List<dynamic> data) {
    return data.map((item) {
      return WeatherDataModel.fromJson(
        Map<String, dynamic>.from(item),
      );
    }).toList();
  }

}