//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Tien Do on 10/23/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @StateObject private var modelData = ModelData()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
    }
    .commands {
      LandmarkCommands()
    }
#if os(macOS)
    Settings {
      LandmarkSettings()
    }
#endif
  }
}
