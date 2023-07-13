//
//  MealListView.swift
//  CookBook
//
//  Created by Dakota Phillips on 7/12/23.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.id) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal)
                            .navigationTitle(meal.name)
                    } label: {
                        Text("\(meal.name)")
                            .foregroundColor(Color(hue: 0.85, saturation: 0.825, brightness: 0.949))
                    }
                }
            }
            .navigationTitle("\(viewModel.category.rawValue) Recipes")
            .toolbar {
                Button("Change Category") {
                    viewModel.changingCategory = true
                }
            }
            .task {
                await viewModel.fetchMealCategory()
            }
        }
        .onChange(of: viewModel.category) { _ in
            Task {
                await viewModel.fetchMealCategory()
            }
        }
        .sheet(isPresented: $viewModel.changingCategory) {
            ChangeCategoryForm(category: $viewModel.category, isPresented: $viewModel.changingCategory)
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}

struct ChangeCategoryForm: View {
    @Binding var category: MealCategory
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            Picker("Category", selection: $category) {
                ForEach(MealCategory.allCases, id: \.rawValue) {
                    Text($0.rawValue)
                        .foregroundColor(Color.gray)
                        .tag($0)
                }
            }
            Button("View Recipes") {
                isPresented = false
            }
        }
    }
}
