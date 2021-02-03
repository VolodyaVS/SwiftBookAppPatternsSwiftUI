//
//  CourseImageView.swift
//  SwiftBookAppPatternsSwiftUI
//
//  Created by Vladimir Stepanchikov on 27.01.2021.
//

import SwiftUI

struct CourseImageView: View {
    let imageData: Data?
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
        
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield")}
        guard let image = UIImage(data: data) else {
            return Image(systemName: "xmark.shield")
            
        }
        return Image(uiImage: image)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        CourseImageView(
            imageData: nil,
            imageSize: CGSize(width: 100, height: 100),
            cornerRadius: 10,
            shadowIsOn: true
            )
    }
}
