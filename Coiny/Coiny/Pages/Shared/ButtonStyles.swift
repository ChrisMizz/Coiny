//
//  ButtonStyle.swift
//  Coiny
//
//  Created by Christoffer Detlef on 01/07/2024.
//

import SwiftUI

struct FlagButtonStyle: ButtonStyle {
	@Environment(\.isEnabled) var isEnabled

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(maxWidth: .infinity)
			.background(isEnabled ? Color.white : Color.gray.opacity(0.8))
			.foregroundStyle(isEnabled ? .primary : .secondary)
	}
}

extension ButtonStyle where Self == FlagButtonStyle {
	static var flagStyle: FlagButtonStyle {
		FlagButtonStyle()
	}
}

struct ButtonStyles: View {
	var body: some View {
		VStack {
			Button("PRESS ME") {
				print("Button pressed!")
			}
			.buttonStyle(.flagStyle)
		}
	}
}

#Preview {
	ButtonStyles()
}
