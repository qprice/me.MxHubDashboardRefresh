import SwiftUI

struct Dashboard: View {
	@State private var selectedSegment = 0
	
	var body: some View {
		VStack(spacing: 0) {
			NavbarPlaceholder()
			
			Picker(selection: $selectedSegment, label: Text("")) {
				Text("My AC").tag(0)
				Text("All AC").tag(1)
			}
			.pickerStyle(SegmentedPickerStyle())
			.frame(height: 48)
			.padding(.top, 16)
			.padding(.bottom, 0)
			
			FlightInfoPlaceholder()
			
			
			ScrollView {
				LazyVGrid(columns: [
					GridItem(.flexible(), spacing: 16),
					GridItem(.flexible(), spacing: 16)
				], spacing: 16) {
					if selectedSegment == 0 {
						AircraftCard(title: "My AC card")
						AircraftCard(title: "My AC card")
						AircraftCard(title: "My AC card")
						AircraftCard(title: "My AC card")
						AircraftCard(title: "My AC card")
						AircraftCard(title: "My AC card")
					} else {
						AircraftCard(title: "All AC card")
						AircraftCard(title: "All AC card")
						AircraftCard(title: "All AC card")
						AircraftCard(title: "All AC card")
						AircraftCard(title: "All AC card")
						AircraftCard(title: "All AC card")
					}
				}
			}
			Spacer()
		}
		.edgesIgnoringSafeArea(.top)
		.padding(.horizontal, 20)
		.background(Color(.secondarySystemBackground))
	}
}

#Preview {
	Dashboard()
}

struct AircraftCard: View {
	var title: String
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 4)
				.foregroundColor(.white)
				.frame(height: 319)
			
			VStack {
				Text(title)
					.font(.headline)
					.foregroundColor(.black)
					.padding()
			}
		}
	}
}
