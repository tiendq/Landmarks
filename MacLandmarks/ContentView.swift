//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Tien Do on 10/24/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
      .frame(minWidth: 700, minHeight: 300)
  }
}

#Preview {
  ContentView()
    .environmentObject(ModelData())
}
