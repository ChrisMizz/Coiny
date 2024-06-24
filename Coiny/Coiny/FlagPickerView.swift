//
//  FlagPickerView.swift
//  Coiny
//
//  Created by Christoffer Detlef on 23/06/2024.
//

import SwiftUI

struct FlagPickerView: View {
	@State var viewModel: ContentViewModel
	@Binding var selectedField: String
	@Environment(\.dismiss) var dismiss

    var body: some View {
		ScrollView {
			ForEach(viewModel.sortedFlags, id: \.key) { currency, emoji in
				HStack {
					Text(emoji)
						.font(.largeTitle)
					Text(currency)
					Spacer()
				}
				.padding()
				.onTapGesture {
					if selectedField == viewModel.selectedCurrency {
						viewModel.selectedCurrency = currency
					} else {
						viewModel.secondarySelectedCurrency = currency
					}
					dismiss()
				}
				
				Divider()
			}
		}
		.onAppear {
			print(selectedField)
		}
    }
}

#Preview {
	FlagPickerView(viewModel: ContentViewModel(), selectedField: .constant(""))
}
