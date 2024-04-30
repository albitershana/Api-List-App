import SwiftUI
struct TriviaResponse: Decodable {
    let results: [Trivia]
}


struct Trivia: Identifiable, Decodable {
    let id = UUID()
    var type: String
    var difficulty: String
    var category: String
    var question: String
    var correct: String?





struct TriviaView: View {
    @State private var trivia = [Trivia]()
    
    var body: some View {
        NavigationStack {  
            List(trivia) { t in
                VStack (alignment: .leading) {
                    Text(t.question)
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text(t.type)
                        .font(.body)
                        .foregroundColor(.black)
                    Text(t.difficulty)
                        .font(.body)
                        .foregroundColor(.black)
                    Text(t.correct) 
                        .font(.headline)
                        .foregroundColor(.green)
                }
            }
            .navigationTitle("Trivia Questions List")
            .task {
                await fetchTriviaData()
            }
        }
    }
    
    func fetchTriviaData() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=20&type=multiple")  else {
            print("THIS URL DOES NOT WORK!")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
            trivia = decodedResponse.results
        } catch {
            print("This data is not valid: \(error)")
        }
    }
}
// for testing
struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
