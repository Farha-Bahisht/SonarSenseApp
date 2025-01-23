//
//  HomePageView2.swift
//  SonarSenseApp
//
//  Created by Farha Bahisht on 11/21/24.
//

/*import SwiftUI

struct HomePageView2: View {
    var body: some View {
        NavigationView {
            List {
                // Section for My Faces
                Section(header: Text("My Faces")) {
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding()
                        VStack(alignment: .leading) {
                            Text("Your watch")
                                .font(.headline)
                            Text("Edit")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                }

                // Section for Settings
                Section {
                    NavigationLink(destination: Text("Notifications")) {
                        SettingsRow2(icon: "bell.fill", title: "Notifications")
                    }
                    NavigationLink(destination: Text("App View")) {
                        SettingsRow2(icon: "circle.grid.2x2.fill", title: "App View")
                    }
                    NavigationLink(destination: Text("General")) {
                        SettingsRow2(icon: "gearshape.fill", title: "General")
                    }
                    NavigationLink(destination: Text("Display & Brightness")) {
                        SettingsRow2(icon: "sun.max.fill", title: "Display & Brightness")
                    }
                    NavigationLink(destination: Text("Gestures")) {
                        SettingsRow2(icon: "hand.point.up.left.fill", title: "Gestures")
                    }
                    NavigationLink(destination: Text("Accessibility")) {
                        SettingsRow2(icon: "figure.walk", title: "Accessibility")
                    }
                }
            }
            .navigationTitle("My Watch")
        }
        .tabBarStyle() // Add a tab bar at the bottom
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

// Extension for tab bar
extension View {
    func tabBarStyle() -> some View {
        self.tabItem {
            Image(systemName: "clock")
            Text("My Watch")
        }
    }
}

struct HomePageView2_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView2()
    }
}
*/
