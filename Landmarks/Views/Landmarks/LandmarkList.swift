//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Tien Do on 10/23/23.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var modelData: ModelData
  @State private var isOnlyFavorites = false
  @State private var filter = FilterCategory.all
  @State private var selectedLandmark: Landmark?

  enum FilterCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"

    var id: FilterCategory { self }
  }

  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (!isOnlyFavorites || landmark.isFavorite)
      && (filter == .all || filter.rawValue == landmark.category.rawValue)
    }
  }

  var title: String {
    let title = filter == .all ? "Landmarks" : filter.rawValue
    return isOnlyFavorites ? "Favorite \(title)" : title
  }

  var index: Int? {
    modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
  }

  var body: some View {
    NavigationView {
      List(selection: $selectedLandmark) {
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
          .tag(landmark)
        }
      }
      .navigationTitle(title)
      .frame(minWidth: 300)
      .toolbar {
        ToolbarItem {
          Menu {
            Picker("Category", selection: $filter) {
              ForEach(FilterCategory.allCases) { category in
                Text(category.rawValue).tag(category)
              }
            }
            .pickerStyle(.inline)

            Toggle(isOn: $isOnlyFavorites) {
              Label("Favorites only", systemImage: "star.fill")
            }
          } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
          }
        }
      }

      Text("Select a Landmark")
    }
    .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
  }
}

#Preview {
  LandmarkList()
    .environment(ModelData())
}
