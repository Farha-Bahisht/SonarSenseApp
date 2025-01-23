//
//  Homeviewtexttospeech.swift
//  SonarSenseApp
//
//  Created by Farha Bahisht on 11/22/24.
//

import SwiftUI
import AVFoundation

import SwiftUI
import AVFoundation

struct HomePageViewTS: View {
    @StateObject private var bluetoothManager = BluetoothManager()
    @State private var vibrationIntensity: Double = 5.0 // Default vibration intensity level
    private let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        NavigationView {
            List {
                // Section for Connection Status
                Section(header: Text("Connection Status")) {
                    HStack {
                        Text(bluetoothManager.isConnected ? "Smartwatch Connected" : "Not Connected")
                            .font(.headline)

                        Spacer()

                        // Add Text-to-Speech button for Connection Status
                        Button(action: {
                            let message = bluetoothManager.isConnected ?
                                "Smartwatch is currently connected." :
                                "Smartwatch is not connected."
                            speak(text: message)
                        }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .foregroundColor(.blue)
                                .padding()
                        }

                        // Bluetooth Scan Button
                        Button(action: {
                            print("Starting Bluetooth Scanning...")
                            bluetoothManager.centralManagerDidUpdateState(bluetoothManager.centralManager)
                        }) {
                            HStack {
                                Image(systemName: "antenna.radiowaves.left.and.right")
                                Text("Scan")
                            }
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
                        Button(action: {
                            speak(text: "Palette is selected. Edit your watch face here.")
                        }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .foregroundColor(.blue)
                                .padding()
                        }
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

                        HStack {
                            Text("Current Intensity: \(Int(vibrationIntensity))")
                                .font(.footnote)
                                .foregroundColor(.gray)

                            Spacer()

                            Button(action: {
                                speak(text: "Current vibration intensity is \(Int(vibrationIntensity)).")
                            }) {
                                Image(systemName: "speaker.wave.2.fill")
                                    .foregroundColor(.blue)
                                    .padding()
                            }
                        }
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

    // Function to handle text-to-speech
    private func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(utterance)
    }
}

struct SettingsRow: View {
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

struct HomePageViewTS_Previews: PreviewProvider {
    static var previews: some View {
        HomePageViewTS()
    }
}
