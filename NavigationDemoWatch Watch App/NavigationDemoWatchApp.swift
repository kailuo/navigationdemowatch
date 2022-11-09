//
//  NavigationDemoWatchApp.swift
//  NavigationDemoWatch Watch App
//
//  Created by Kai on 11/10/22.
//

import SwiftUI

@main
struct NavigationDemoWatch_Watch_AppApp: App {
    @StateObject var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $viewModel.path) {
                List {
                    // Row 1: Tap to push to Section A
                    HStack {
                        NavigationLink("Section A", value: ViewDestination.sectionA)
                        Spacer()
                    }
                    .frame(height: 80)

                    // Row 2: Tap to push to Section B
                    HStack {
                        NavigationLink("Section A", value: ViewDestination.sectionB)
                        Spacer()
                    }
                    .frame(height: 80)

                    // Row 3: two buttons: city list view button, settings view button
                    HStack {
                        NavigationLink(value: ViewDestination.city) {
                            Image(systemName: "building")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                        Spacer()
                        NavigationLink(value: ViewDestination.settings) {
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                    }
                    .padding(.horizontal, 12)
                    .frame(height: 80)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.carousel)
                .navigationDestination(for: ViewDestination.self) { destination in
                    ViewFactory.viewForDestination(destination)
                }
                .navigationTitle("City mini")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


class ViewModel: ObservableObject {
    @Published var path = NavigationPath()
}


struct SectionAView: View {
    var body: some View {
        Text("A")
    }
}


struct SectionBView: View {
    var body: some View {
        Text("B")
    }
}


struct SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}


struct CityView: View {
    var body: some View {
        Text("City List")
    }
}


enum ViewDestination {
    case sectionA
    case sectionB
    case city
    case settings
}


class ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: ViewDestination) -> some View {
        switch destination {
            case .sectionA:
                SectionAView()
            case .sectionB:
                SectionBView()
            case .city:
                CityView()
            case .settings:
                SettingsView()
        }
    }
}
