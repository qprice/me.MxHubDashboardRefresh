import SwiftUI

struct Dashboard: View {
	@State private var selectedSegment = 0
	var body: some View {
		VStack(spacing: 0) {
			NavbarPlaceholder()
			
			// Find way to increase height
			Picker(selection: $selectedSegment, label: Text("")) {
				Text("My AC").tag(0)
				Text("All AC").tag(1)
			}
			.pickerStyle(SegmentedPickerStyle())
			.frame(height: 48)
			.padding(.top, 16)
			.padding(.bottom, 0)
			
			TimestampPlaceholder()
			
			ScrollView {
				LazyVGrid(columns: [
					GridItem(.flexible(), spacing: 16),
					GridItem(.flexible(), spacing: 16)
				], spacing: 16) {
					if selectedSegment == 0 {
						AircraftCard(
							aircraftNum: "619AS",
							aircraftStatus: "ETOPS OTS",
							maintNum: 8,
							deferralNum: 12,
							maintInfoNum: 5)
						AircraftCard(
							aircraftNum: "619AS",
							aircraftStatus: "ETOPS Restricted",
							maintNum: 8,
							deferralNum: 12,
							maintInfoNum: 5)
						AircraftCard(
							aircraftNum: "619AS",
							aircraftStatus: "ETOPS",
							maintNum: 8,
							deferralNum: 12,
							maintInfoNum: 5)
						AircraftCard(
							aircraftNum: "619AS",
							aircraftStatus: "OTS",
							maintNum: 0,
							deferralNum: 0,
							maintInfoNum: 0)
						AircraftCard(
							aircraftNum: "619AS",
							aircraftStatus: "ETOPS Restricted",
							maintNum: 8,
							deferralNum: 12,
							maintInfoNum: 5)
						AircraftCard(
							aircraftNum: "619AS",
							aircraftStatus: "ETOPS",
							maintNum: 8,
							deferralNum: 12,
							maintInfoNum: 5)
					} else {
						AircraftCard(
							aircraftNum: "619AS",
							aircraftStatus: "ETOPS OTS",
							maintNum: 8,
							deferralNum: 12,
							maintInfoNum: 5)
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
	// TODO: Create struct to capture values for this?
	var aircraftNum: String
	var aircraftStatus: String
	var maintNum: Int = 0
	var deferralNum: Int = 0
	var maintInfoNum: Int = 0
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 4)
				.foregroundColor(.white)
				.frame(height: 319)
			
			VStack(spacing: 0) {
				HStack(spacing: 0) {
					VStack(alignment: .leading, spacing: 1) {
						Text(aircraftNum)
							.font(.title2)
							.padding(0)
							.fontWeight(.bold)
						Text(aircraftStatus)
							.font(.footnote)
							.fontWeight(.bold)
							.padding(.horizontal, 3)
							.foregroundColor(.white)
							.background(getBadgeColor())
							.cornerRadius(4)
					}
					
					Spacer()
					
					VStack(alignment: .leading, spacing: 8) {
						HStack(spacing: 8) {
							Image(systemName: "checkmark.circle")
								.font(.footnote)
								.fontWeight(.semibold)
								.padding(0)
								.foregroundColor(Color(uiColor: .systemGreen))
							
							Text("Transit Check")
								.font(.footnote)
								.padding(0)
						}
						HStack(spacing: 8) {
							Image(systemName: "exclamationmark.octagon")
								.font(.footnote)
								.fontWeight(.semibold)
								.padding(0)
								.foregroundColor(Color(uiColor: .systemRed))
							
							Text("ETOPS PDC")
								.font(.footnote)
								.padding(0)
						}
					}
					.padding(.trailing, 16)
					
					VStack(alignment: .leading, spacing: 8) {
						HStack(spacing: 8) {
							Image(systemName: "exclamationmark.octagon")
								.font(.footnote)
								.fontWeight(.semibold)
								.padding(0)
								.foregroundColor(Color(uiColor: .systemRed))

							Text("Logbook")
								.font(.footnote)
								.padding(0)
						}
						HStack(spacing: 8) {
							Image(systemName: "checkmark.circle")
								.font(.footnote)
								.fontWeight(.semibold)
								.padding(0)
								.foregroundColor(Color(uiColor: .systemGreen))
							
							Text("FFM&G")
								.font(.footnote)
								.padding(0)
						}
					}
				}
				
				.padding(.bottom, 12)
				HStack {
					InfoButton(
						symbol: "wrench",
						text: "Maint. Task",
						num: maintNum,
						numColor: Color(uiColor: .red))
					InfoButton(
						symbol: "gear",
						text: "Deferrals",
						num: deferralNum,
						numColor: .black)
					InfoButton(
						symbol: "info.circle",
						text: "Maint. Info",
						num: maintInfoNum,
						numColor: Color(uiColor: .red))
				}
				
				Spacer()
			}
			.padding(20)
		}
	}
	
	func getBadgeColor() -> Color {
		switch aircraftStatus.uppercased() {
		case "ETOPS RESTRICTED":
			return Color(uiColor: .orange)
		case "ETOPS":
			return Color(.alaskaBlue)
		case "OTS", "ETOPS OTS":
			return Color(uiColor: .red)
		default:
			return .clear
		}
	}
}

struct InfoButton: View {
	var symbol: String
	var text: String
	var num: Int
	var numColor: Color
	
	var body: some View {
		Button {
			print("Button tapped!")
		} label: {
			RoundedRectangle(cornerRadius: 8)
				.foregroundColor(Color(.secondarySystemBackground))
				.frame(height: 81)
			
				.overlay(
					VStack(spacing: 0) {
						Image(systemName: symbol)
							.font(.footnote)
							.fontWeight(.semibold)
							.foregroundColor(.alaskaBlue)
						
						Text(text)
							.font(.footnote)
//							.fontWeight(.semibold)
							.foregroundColor(.alaskaBlue)
							.lineLimit(1)
							.padding(.bottom, 4)
						
						if num <= 0 && text.contains("Maint.") {
							Image(systemName: "checkmark.circle")
								.font(.body)
								.fontWeight(.semibold)
								.foregroundColor(Color(uiColor: .systemGreen))
								.padding(.bottom, 0)
						} else {
							Text(String(num))
								.font(.title2)
								.foregroundColor(numColor)
								.fontWeight(.bold)
								.padding(.bottom, 0)
								.lineLimit(1)
								.truncationMode(.tail)
						}
					}
						.padding(.vertical, 11)
						.padding(.horizontal, 4)
				)
				.overlay(
					(num > 0 && text.contains("Maint.")) ?
					Circle()
						.frame(width: 16, height: 16)
						.foregroundColor(.red)
						.offset(x: 6, y: -6)
					: nil,
					alignment: .topTrailing
				)
		}
	}
}

struct NotificationDot: View {
	var body: some View {
		Circle()
			.frame(width: 16, height: 16)
			.foregroundColor(.red.opacity(1))
			.alignmentGuide(.trailing) { _ in
				11.5
			}
			.alignmentGuide(.top) { _ in
				5.5
			}
	}
}

struct MaintButtonInfo {
	var maintNum: Int = 0
	var deferralNum: Int = 0
	var msgNum: Int = 0
	var etopsNum: Int = 0
}
