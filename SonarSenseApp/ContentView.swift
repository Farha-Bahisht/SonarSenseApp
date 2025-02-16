//
//  ContentView.swift
//  SonarSenseApp
//
//  Created by Farha Bahisht on 11/21/24.
//

import SwiftUI

struct Homeviewtexttospeech: View {
    @StateObject private var bluetoothManager = BluetoothManager()
    @State private var vibrationIntensity: Double = 5.0 // Default vibration intensity level

    var body: some View {
        NavigationView {
            List {
                // Section for Connection Status
                Section(header: Text("Connection Status")) {
                    HStack {
                        Text(bluetoothManager.isConnected ? "Smartwatch Connected" : "Not Connected")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            print("Starting Bluetooth Scanning...")
                            bluetoothManager.centralManagerDidUpdateState(bluetoothManager.centralManager)
                        }) {
                            Text("Scan")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }

                // Section for My Faces
                Section(header: Text("My Faces")) {
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding()
                        VStack(alignment: .leading) {
                            Text("Palette")
                                .font(.headline)
                            Text("Edit")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                }

                // Section for Vibration Intensity
                Section(header: Text("Vibration Intensity")) {
                    VStack {
                        Text("Adjust Vibration Level")
                            .font(.subheadline)
                            .padding(.bottom, 5)

                        Slider(value: $vibrationIntensity, in: 1...10, step: 1) {
                            Text("Vibration Intensity")
                        }
                        .padding()

                        Text("Current Intensity: \(Int(vibrationIntensity))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }

                // Section for Settings
                Section(header: Text("Settings")) {
                    NavigationLink(destination: Text("Notifications")) {
                        SettingsRow(icon: "bell.fill", title: "Notifications")
                    }
                    NavigationLink(destination: Text("App View")) {
                        SettingsRow(icon: "circle.grid.2x2.fill", title: "App View")
                    }
                    NavigationLink(destination: Text("General")) {
                        SettingsRow(icon: "gearshape.fill", title: "General")
                    }
                }
            }
            .navigationTitle("My Watch")
        }
    }
}

struct SettingsRow2: View {
    var icon: String
    var title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            Text(title)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        Homeviewtexttospeech()
    }
}
