//
//  CourseDetailsView.swift
//  SwiftBookAppPatternsSwiftUI
//
//  Created by Vladimir Stepanchikov on 27.01.2021.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDetailsViewViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.courseName)
                .font(.largeTitle)
            ZStack {
                CourseImageView(
                    imageData: viewModel.imageData,
                    imageSize: CGSize(width: 230, height: 180),
                    cornerRadius: 30,
                    shadowIsOn: true
                )
                FavoriteStatusButton(isFavorite: viewModel.isFavorite) {
                    viewModel.toggleFavoriteStatus()
                }
            }
            Text(viewModel.numberOfLessons)
                .font(.headline)
            Text(viewModel.numberOfTests)
                .font(.headline)
            Spacer()
        }
    }
}

struct FavoriteStatusButton: View {
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Image(isFavorite ? "heartIcon" : "unselectedHeart")
            .resizable()
            .frame(width: 30, height: 30)
            .offset(x: 95, y: 65)
        Button("  ", action: action)
            .offset(x: 95, y: 65)
    }
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(viewModel: CourseDetailsViewViewModel(course: .getCourse()))
    }
}
