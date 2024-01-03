//
//  ContentView.swift
//  Weather
//
//  Created by Vishal Wagh on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack(spacing:20) {
                CityTextView(cityName: "Parbhani, MH, INDIA")
                
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 76)
                
                HStack(spacing:20) {
                    WeatherDaysView(daysOfWeek: "TUE",
                                    imageName: "cloud.sun.fill",
                                    temperature: 74)
                    WeatherDaysView(daysOfWeek: "WED",
                                    imageName: "sun.max.fill",
                                    temperature: 70)
                    WeatherDaysView(daysOfWeek: "THU",
                                    imageName: "wind.snow",
                                    temperature: 66)
                    WeatherDaysView(daysOfWeek: "FRI",
                                    imageName: "sunset.fill",
                                    temperature: 60)
                    WeatherDaysView(daysOfWeek: "SAT",
                                    imageName: "snow",
                                    temperature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backGroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDaysView: View {
    
    var daysOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(daysOfWeek)
                .font(.system(size: 25, weight: .medium , design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 35, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors:
                            [isNight ? .black : .blue,
                            isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
            //.edgesIgnoringSafeArea(.all) //deprecate
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 35, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView :View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 75, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}
