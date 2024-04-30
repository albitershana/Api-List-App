//
//  ContentView.swift
//  hw4
//
//  Created by somebody else on 3/15/24.
//

import SwiftUI
struct ContentView: View {
var body: some View {
NavigationView {
VStack {
// 1) JSON URL ------------
NavigationLink(destination: CurrencyView()) {
Text("WORLD CURRENCY ABBREVIATIONS")
.font(.title3)
.padding(.bottom, 15)
}

// 2) JSON URL ------------
NavigationLink(destination: TodosView()) {
Text("TO DO LIST")
.font(.title3)
.padding(.bottom, 15)
}
NavigationLink(destination: CommentsView()) {
    Text("COMMENTS LIST")
    .font(.title3)
    .padding(.bottom, 15)
    }
    NavigationLink(destination: HolidaysView()) {
        Text("HOLIDAYS LIST")
        .font(.title3)
        .padding(.bottom, 15)
        }
    NavigationLink(destination: TriviaView()) {
        Text("TRIVIA QUESTIONS LIST")
        .font(.title3)
        .padding(.bottom, 15)
        }
    
} // end vertical Stack
.navigationTitle("JSON SAMPLE URLs")
} // end navigation view
} // end body
} // end struct
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
