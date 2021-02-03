//
//  ContentView.swift
//  SwiftBookAppPatternsSwiftUI
//
//  Created by Vladimir Stepanchikov on 27.01.2021.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.courses, id: \.name) { course in
                NavigationLink(destination: CourseDetailsView(viewModel: CourseDetailsViewViewModel(course: course))) {
                    RowView(viewModel: RowViewViewModel(course: course))
                }
            }
            .navigationBarTitle("Courses")
        }
        .onAppear {
            viewModel.fetchCourses()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
