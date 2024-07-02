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
	
	@State private var searchText = ""

    var body: some View {
		NavigationStack {
			ScrollView {
				VStack(spacing: 0) {
					ForEach(viewModel.filteredFlags(searchText), id: \.key) { currency, emoji in
						flagCell(currency: currency, emoji: emoji)
					}
				}
				.searchable(text: $searchText)
			}
		}
    }
	
	private func flagCell(currency: String, emoji: String) -> some View {
		Button {
			if selectedField == viewModel.selectedCurrency {
				viewModel.selectedCurrency = currency
			} else {
				viewModel.secondarySelectedCurrency = currency
			}
			
			dismiss()
		} label: {
			VStack {
				HStack {
					Text(emoji)
						.font(.largeTitle)
					
					Text(currency)
					
					Spacer()
				}
				.padding()

				Divider()
			}
		}
		.disabled(viewModel.disableFlagCellButton(currency: currency))
		.buttonStyle(.flagStyle)
	}
}

#Preview {
	FlagPickerView(viewModel: ConversionViewModel(), selectedField: .constant(""))
}
