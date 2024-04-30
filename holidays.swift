//
    //  View4.swift
    //  hw4
    //
    //  Created by somebody else on 3/15/24.
    //
    import SwiftUI
    struct Holidays: Identifiable, Decodable {
    let id = UUID()
        var date: String
    var name: String
    var countryCode: String

    }


    struct HolidaysView: View {
        @State private var holidays = [Holidays]()
        var body: some View {
            NavigationView {
            List(holidays) { t in
                VStack (alignment: .leading) {
                    Text(t.date)
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text(t.name)
                        .font(.body)
                        .foregroundColor(.indigo)
                    Text(t.countryCode)
                        .font(.body)
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Holidays List")
            .task {
                await fetchHolidaysData()
            }
        }
    }
    
    func fetchHolidaysData() async {
        // create the URL
        guard let url = URL(string: "https://date.nager.at/api/v2/publicholidays/2020/US") else {
            
            print("THIS URL DOES NOT WORK!")
            return
        }
        // fetch the data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // decode that data
            holidays = try JSONDecoder().decode([Holidays].self, from: data)
            
            } catch {
print("This data is not valid: \(error)")
// ecode the data
}
}
}
struct HolidaysView_Previews: PreviewProvider {
static var previews: some View {
HolidaysView()
}
}
