//
//  Placeholders.swift
//  MxHub Dashboard Refresh
//
//  Created by Quinton Price on 11/30/23.
//

import SwiftUI

struct NavbarPlaceholder: View {
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

			Text("Secondary Navbar")
				.font(.headline)
				.foregroundColor(.white)
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
