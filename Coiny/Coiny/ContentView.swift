//
//  ContentView.swift
//  Coiny
//
//  Created by Christoffer Detlef on 24/03/2024.
//

import SwiftUI

struct ContentView: View {
	@State private var viewModel = ContentViewModel()
	@State private var topValue: Double? = nil
	@State private var bottomValue: Double? = nil

	@State private var presentFlagView = false
	@State private var selectedField: String = ""
	@FocusState private var primaryTextFieldFocusState: Bool
	@FocusState private var secondaryTextFieldFocusState: Bool

	var body: some View {
		VStack(spacing: 20) {
			Spacer()
			
			topSection
			
			Divider()
				.padding(.vertical, 20)
			
			bottomSection
			
			Spacer()
		}
		.onChange(of: topValue ?? 0) { _, input in
			if primaryTextFieldFocusState {
				bottomValue = viewModel.convertCurrency(input: input, fromCurrency: viewModel.selectedCurrency, toCurrency: viewModel.secondarySelectedCurrency)
			}
		}
		.onChange(of: bottomValue ?? 0) { _, input in
			if secondaryTextFieldFocusState {
				topValue = viewModel.convertCurrency(input: input, fromCurrency: viewModel.secondarySelectedCurrency, toCurrency: viewModel.selectedCurrency)
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
				presentFlagView.toggle()
			} label: {
				currencySelector(viewModel.selectedCurrency)
			}

			input(topValue)
				.focused($primaryTextFieldFocusState)
			
			Text("1 \(viewModel.secondarySelectedCurrency) = \(viewModel.convertCurrency(fromCurrency: viewModel.secondarySelectedCurrency, toCurrency: viewModel.selectedCurrency)) \(viewModel.selectedCurrency)")
				.font(.subheadline)
				.foregroundStyle(.secondary)

		}
	}
	
	private var bottomSection: some View {
		VStack(spacing: 0) {
			Button {
				selectedField = viewModel.secondarySelectedCurrency
				presentFlagView.toggle()
			} label: {
				currencySelector(viewModel.secondarySelectedCurrency)
			}
			
			input(bottomValue)
				.focused($secondaryTextFieldFocusState)
			
			Text("1 \(viewModel.selectedCurrency) = \(viewModel.convertCurrency(fromCurrency: viewModel.selectedCurrency, toCurrency: viewModel.secondarySelectedCurrency)) \(viewModel.secondarySelectedCurrency)")
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
	
	private func input(_ selectedValue: Double?) -> some View {
		TextField("0", value: Binding(
			get: { selectedValue },
			set: {
				if primaryTextFieldFocusState {
					topValue = $0
				} else {
					bottomValue = $0
				}
			}
		),format: .number)
		.keyboardType(.decimalPad)
		.padding()
		.multilineTextAlignment(.center) // Center the text inside the TextField
		.font(.system(size: 60))
	}

	private func resetValues() {
		primaryTextFieldFocusState = false
		secondaryTextFieldFocusState = false
		topValue = nil
		bottomValue = nil
	}
}

#Preview {
    ContentView()
}
