//
//  ConversionViewModel.swift
//  Coiny
//
//  Created by Christoffer Detlef on 24/03/2024.
//

import SwiftUI
import Observation
import ObservableUserDefault

@Observable
class ConversionViewModel {
	// Published variables
	var selectedCurrency: String = "EUR"
	var secondarySelectedCurrency: String = "USD"
	
	var fetchingData: Bool = true
	
	var currencyData: CurrencyDataResponse = .emptyData()
	
	var formattedDateString: String {
		guard let date = DateFormatter.currencyDateFormat.date(from: currencyData.date) else {
			return "Invalid date"
		}
		
		return DateFormatter.fetchedDateFormat.string(from: date)
	}
	

	// Stores the last time a user fetched the data again.
	@ObservableUserDefault(.init(key: "lastPressedTime", store: .standard))
	@ObservationIgnored
	var lastPressedTime: Date?

	init() {
		fetchCurrencyData()
	}
}


// MARK: Public functions
extension ConversionViewModel {
	func flagEmoji(currency: String) -> String {
		return FlagEmoji.flagEmojis[currency] ?? "🌐"
	}
	
	func convertCurrency(input: Double = 1, isTopSection: Bool) -> Double {
		guard
			let fromRate = currencyData.rates[isTopSection ? selectedCurrency : secondarySelectedCurrency],
			let toRate = currencyData.rates[isTopSection ? secondarySelectedCurrency : selectedCurrency] 
		else {
			return 0
		}

		let conversionRate = fromRate / toRate

		return input / conversionRate
	}
	
	func fetchCurrencyData() {
		self.fetchingData = true
		
		APIService.fetchData(urlString: "https://api.fxratesapi.com/latest", responseType: CurrencyDataResponse.self) { response in
			self.currencyData = response
			self.fetchingData = false
		}
	}
	
	func disableFlagCellButton(currency: String) -> Bool {
		if selectedCurrency == currency || secondarySelectedCurrency == currency {
			return true
		}
		
		return false
	}
	
	func canPressButton() -> Bool {
		guard let lastPressedTime = lastPressedTime else {
			return true
		}
		
		let timeSinceLastPress = Date().timeIntervalSince(lastPressedTime)
		let twoHoursInSeconds: TimeInterval = 2 * 60 * 60 // 2 hours in seconds
		
		return timeSinceLastPress >= twoHoursInSeconds
	}
	
	func filteredFlags(_ searchText: String) -> [(key: String, value: String)] {
		if searchText.isEmpty {
			return FlagEmoji.sortedFlags
		} else {
			return FlagEmoji.sortedFlags.filter { $0.key.contains(searchText) || $0.value.contains(searchText) }
		}
	}
}
