//
//  FlagPickerView.swift
//  Coiny
//
//  Created by Christoffer Detlef on 23/06/2024.
//

import SwiftUI

struct FlagPickerView: View {
	@State var viewModel: ConversionViewModel
	@Binding var selectedField: String
	@Environment(\.dismiss) var dismiss

    var body: some View {
		ScrollView {
			ForEach(FlagEmoji.sortedFlags, id: \.key) { currency, emoji in
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
	FlagPickerView(viewModel: ConversionViewModel(), selectedField: .constant(""))
}
