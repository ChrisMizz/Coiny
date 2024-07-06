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
	@State private var showAlert = false

	@FocusState private var focusedField: FocusField?

	var body: some View {
		VStack(spacing: 20) {
			Spacer()
			
			topSection
			
			divider
			
			bottomSection
			
			Spacer()
			
			if viewModel.fetchingData {
				ProgressView()
			} else {
				fetchedText
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
		.toolbar {
			ToolbarItemGroup(placement: .keyboard) {
				toolbarItem
			}
		}
		.alert("Data already fetched", isPresented: $showAlert) {
			Button("Close", role: .cancel) {}
		} message: {
			Text("The data has already been fetched. You will have to wait a bit until you can try and fetch it again")
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
	
	private var toolbarItem: some View {
		HStack {
			Spacer()
			
			Button {
				focusedField = nil
			} label: {
				Text("Close")
					.foregroundStyle(.black)
			}
		}
	}
	
	private var fetchedText: some View {
		Text(viewModel.formattedDateString)
			.font(.subheadline)
			.foregroundStyle(.secondary)
			.onTapGesture {
				if viewModel.canPressButton() {
					// Fetch the newest currency data.
					viewModel.fetchCurrencyData()
					viewModel.lastPressedTime = .now
				} else {
					// Show alert
					showAlert = true
				}
			}
	}
}

extension ConversionView {
	private func resetValues() {
		focusedField = nil
		topValue = nil
		bottomValue = nil
	}
}

#Preview {
	ConversionView()
}
