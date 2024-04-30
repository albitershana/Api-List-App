//
//  View4.swift
//  hw4
//
//  Created by somebody else on 3/15/24.
//
import SwiftUI
struct Comments: Decodable {
var id: Int
var name: String
var email: String
var body: String
}
struct CommentsView: View {
@State private var comments = [Comments]()
var body: some View {
NavigationView {
List(comments, id: \.id) { t in
VStack (alignment: .leading) {
Text(t.name)
.font(.headline)
.foregroundColor(.cyan)
Text(t.email)
.font(.body)
.foregroundColor(.indigo)
Text(t.body)
.font(.body)
.foregroundColor(.red)
}
}
.navigationTitle("Comments List")
.task {
await fetchCommentsData()
}
}
}

func fetchCommentsData() async {
// create the URL
guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {

print("THIS URL DOES NOT WORK!")
return
}
// fetch the data
do {
let (data, _) = try await
URLSession.shared.data(from: url)
// decode that data
if let decodedResponse = try?
JSONDecoder().decode([Comments].self, from: data) {
comments = decodedResponse
}
} catch {
print("This data is not valid")
}
// ecode the data
}
}

struct CommentsView_Previews: PreviewProvider {
static var previews: some View {
CommentsView()
}
}

