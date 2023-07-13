//
//  MealDetailView.swift
//  CookBook
//
// Created by Dakota Phillips on 7/12/23.
//

import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    
    @StateObject private var viewModel: ViewModel
    
    init(meal: Meal) {
        self.meal = meal
        _viewModel = StateObject(wrappedValue: ViewModel(meal: meal))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MealRemoteImage(url: meal.thumbnailURL!)
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                Section {
                    ForEach(viewModel.ingredients) { ingredient in
                        HStack {
                            Text(ingredient.name)
                            Text(" - ")
                            Text(ingredient.quantity)
                        }
                    }
                } header: {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.048, saturation: 1.0, brightness: 1.0))
                        .padding()
                }
                
                Section {
                    Text(viewModel.instructions)
                } header: {
                    Text("Instructions")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                }
                .padding()
                
            }
            .task {
                await viewModel.fetchMealDetails()
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal.example)
            
    }
}
