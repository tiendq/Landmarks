//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Tien Do on 10/23/23.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark

  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
        .cornerRadius(5)
      VStack(alignment: .leading) {
        Text(landmark.name)
          .bold()
        Text(landmark.park)
          .font(.caption)
          .foregroundColor(.secondary)
      }

      Spacer()

      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
      }
    }
    .padding(.vertical, 4)
  }
}

#Preview {
  let landmarks = ModelData().landmarks

  return Group {
    LandmarkRow(landmark: landmarks[0])
    LandmarkRow(landmark: landmarks[1])
  }
}

/*
#Preview("Turtle Rock") {
  LandmarkRow(landmark: landmarks[0])
}

#Preview("Salmon") {
  LandmarkRow(landmark: landmarks[1])
}
*/
