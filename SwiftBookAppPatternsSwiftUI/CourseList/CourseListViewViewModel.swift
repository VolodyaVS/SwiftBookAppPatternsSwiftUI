//
//  CourseListViewModel.swift
//  SwiftBookAppPatternsSwiftUI
//
//  Created by Vladimir Stepanchikov on 27.01.2021.
//

import Foundation

protocol CourseListViewViewModelProtocol {
    var courses: [Course] { get }
    func fetchCourses()
    
}

class CourseListViewViewModel: CourseListViewViewModelProtocol, ObservableObject {
    @Published var courses: [Course] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { courses in
            self.courses = courses
        }
    }
}
