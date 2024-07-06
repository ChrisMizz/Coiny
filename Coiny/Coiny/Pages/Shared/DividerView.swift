//
//  DividerView.swift
//  Coiny
//
//  Created by Christoffer Detlef on 06/07/2024.
//

import SwiftUI

var divider: some View {
	Rectangle()
		.fill(Color.gray.opacity(0.3))
		.frame(height: 1)
		.edgesIgnoringSafeArea(.horizontal)
		.padding(.vertical, 20)
}

#Preview {
    divider
}
