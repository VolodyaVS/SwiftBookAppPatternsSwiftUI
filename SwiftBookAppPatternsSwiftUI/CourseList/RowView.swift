//
//  RowView.swift
//  SwiftBookAppPatternsSwiftUI
//
//  Created by Vladimir Stepanchikov on 27.01.2021.
//

import SwiftUI

struct RowView: View {
    let viewModel: RowViewViewModel
    
    var body: some View {
        HStack{
            CourseImageView(
                imageData: viewModel.imageData,
                imageSize: CGSize(width: 130, height: 100),
                cornerRadius: 10,
                shadowIsOn: false
            )
            Text(viewModel.courseName)
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(viewModel: RowViewViewModel(course: .getCourse()))
    }
}
