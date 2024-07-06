//
//  TabbarView.swift
//  Coiny
//
//  Created by Christoffer Detlef on 03/07/2024.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
		TabView {
			ConversionView()
				.tabItem {
					Label("Conversion", systemImage: "arrow.left.arrow.right")
				}
			
			MultipleConversionView()
				.tabItem {
					Label("Multiple Conversion", systemImage: "arrow.2.squarepath")
				}

			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gearshape")
				}
		}
    }
}

#Preview {
    TabbarView()
}
