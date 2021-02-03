//
//  CourseDetailsViewViewModel.swift
//  SwiftBookAppPatternsSwiftUI
//
//  Created by Vladimir Stepanchikov on 27.01.2021.
//

import Foundation

protocol CourseDetailsViewViewModelProtocol: class {
    var courseName: String { get }
    var imageData: Data? { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var isFavorite: Bool { get }
    
    init(course: Course)
}

class CourseDetailsViewViewModel: CourseDetailsViewViewModelProtocol, ObservableObject {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavouriteStatus(for: course.name, with: isFavorite)
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = DataManager.shared.loadFavouriteStatus(for: course.name)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
    }
}
