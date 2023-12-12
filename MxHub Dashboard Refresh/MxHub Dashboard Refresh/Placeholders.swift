//
//  Placeholders.swift
//  MxHub Dashboard Refresh
//
import SwiftUI

struct NavbarPlaceholder: View {
	@Binding var sliderValue: Double
	var showSlider: Bool = false
	
	var body: some View {
		ZStack {
			Rectangle()
				.frame(height: 53)
				.foregroundColor(Color.gray)
				.padding(.horizontal, -20)
			
			Text("Primary Navbar")
				.font(.headline)
				.foregroundColor(.white)
		}
		
		ZStack {
			Rectangle()
				.frame(height: 53)
				.foregroundColor(Color.teal)
				.padding(.horizontal, -20)
			
			if showSlider {
				HStack {
					Slider(value: $sliderValue, in: 0...30, step: 1.0)
						.frame(width: 300)
					Text("Cards shown: \(Int(sliderValue))")
						.font(.headline)
						.foregroundColor(.white)
				}
			} else {
				Text("Secondary Navbar")
					.font(.headline)
					.foregroundColor(.white)
			}
		}
	}
}

struct TimestampPlaceholder: View {
	var body: some View {
		HStack(spacing: 0) {
			Text("Sunday, September 2, 2023 ")
				.font(.footnote)
				.foregroundColor(.secondary)
				.fontWeight(.semibold)
			
			Spacer()
			
			HStack {
				Image(systemName: "square.and.arrow.down")
				Text("Last updated 1 min ago")
			}
			.font(.footnote)
			.foregroundColor(.secondary)
			.fontWeight(.semibold)
			
		}
		
		.padding(.vertical, 8)
	}
}
