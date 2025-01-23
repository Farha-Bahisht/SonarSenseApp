//
//  SettingsView.swift
//  SonarSenseApp
//
//  Created by Farha Bahisht on 11/21/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var sensitivityLevel: Double = 5.0

    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .padding()

            Slider(value: $sensitivityLevel, in: 1...10, step: 1)
                .padding()

            Text("Current Sensitivity: \(Int(sensitivityLevel))")
                .padding()

            Button(action: {
                print("Settings saved! Sensitivity Level: \(sensitivityLevel)")
            }) {
                Text("Save Settings")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
