import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:np_weather/model/weathercurrent_data.dart';
import 'package:np_weather/utils/app_colors.dart';
import 'package:np_weather/utils/app_textstyle.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Temperature
        TemperatureWidget(),
        SizedBox(height: 10),
        //More details: wind, clouds, humidity
        MoreDetailsWidget(),
      ],
    );
  }

  Widget TemperatureWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: AppColors.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.current.temp!.toInt()}°C",
                style: AppTextstyle.h1Bold,
              ),
              TextSpan(
                text: "  ${weatherDataCurrent.current.weather![0].description}",
                style: AppTextstyle.h6Regular,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget MoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Iconsax.wind5,
                size: 30,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Iconsax.cloud,
                size: 30,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Iconsax.drop3,
                size: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed} km/h",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds} %",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity} %",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}

//Text('${weatherDataCurrent.current.weather![0].description}'),