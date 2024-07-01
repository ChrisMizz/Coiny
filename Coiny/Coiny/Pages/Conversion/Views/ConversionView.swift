//
//  ConversionView.swift
//  Coiny
//
//  Created by Christoffer Detlef on 24/03/2024.
//

import SwiftUI

struct ConversionView: View {
	@State private var viewModel = ConversionViewModel()
	@State private var topValue: Double? = nil
	@State private var bottomValue: Double? = nil
	@State private var presentFlagView = false
	@State private var selectedField: String = ""

	@FocusState private var focusedField: FocusField?

	var body: some View {
		VStack(spacing: 20) {
			Spacer()
			
			topSection
			
			Divider()
				.padding(.vertical, 20)
			
			bottomSection
			
			Spacer()
			
			if viewModel.fetchingData {
				ProgressView()
			} else {
				Text(viewModel.formattedDateString)
					.font(.subheadline)
					.foregroundStyle(.secondary)
					.onTapGesture {
						// TODO: - Limit this to only allow this once every hour or something like that -CAD
						viewModel.fetchCurrencyData()
					}
			}
		}
		.onChange(of: topValue ?? 0) { _, input in
			if focusedField == .topSection {
				bottomValue = viewModel.convertCurrency(input: input, isTopSection: true)
			}
		}
		.onChange(of: bottomValue ?? 0) { _, input in
			if focusedField == .bottomSection {
				topValue = viewModel.convertCurrency(input: input, isTopSection: false)
			}
		}
		.sheet(isPresented: $presentFlagView, onDismiss: resetValues) {
			FlagPickerView(viewModel: viewModel, selectedField: $selectedField)
		}
	}
	
	
	private var topSection: some View {
		VStack(spacing: 0) {
			Button {
				selectedField = viewModel.selectedCurrency
				focusedField = nil
				presentFlagView.toggle()
			} label: {
				currencySelector(viewModel.selectedCurrency)
			}

			CurrencyInputField(value: $topValue, field: .topSection, focusedField: _focusedField)
			
			Text("1 \(viewModel.secondarySelectedCurrency) = \(viewModel.convertCurrency(isTopSection: false)) \(viewModel.selectedCurrency)")
				.font(.subheadline)
				.foregroundStyle(.secondary)

		}
	}
	
	private var bottomSection: some View {
		VStack(spacing: 0) {
			Button {
				selectedField = viewModel.secondarySelectedCurrency
				focusedField = nil
				presentFlagView.toggle()
			} label: {
				currencySelector(viewModel.secondarySelectedCurrency)
			}
			
			CurrencyInputField(value: $bottomValue, field: .bottomSection, focusedField: _focusedField)
			
			Text("1 \(viewModel.selectedCurrency) = \(viewModel.convertCurrency(isTopSection: true)) \(viewModel.secondarySelectedCurrency)")
				.font(.subheadline)
				.foregroundStyle(.secondary)
		}
	}
	
	private func currencySelector(_ selectedCurrency: String) -> some View {
		VStack {
			HStack {
				Text(viewModel.flagEmoji(currency: selectedCurrency))
					.font(.largeTitle)
				
				Text(selectedCurrency)
					.font(.title3)
				
				Image(systemName: "chevron.up.chevron.down")
					.font(.title3)
			}
			.foregroundStyle(.black)
		}
	}

	private func resetValues() {
		focusedField = nil
		topValue = nil
		bottomValue = nil
	}
}

#Preview {
	ConversionView()
}
