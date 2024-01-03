//
//  WeatherButton.swift
//  Weather
//
//  Created by Vishal Wagh on 02/01/24.
//

import SwiftUI
struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backGroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backGroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
