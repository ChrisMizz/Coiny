//
//  ConversionViewModel.swift
//  Coiny
//
//  Created by Christoffer Detlef on 24/03/2024.
//

import SwiftUI
import Combine
import Observation

@Observable
class ConversionViewModel {
	var selectedCurrency: String = "EUR"
	var secondarySelectedCurrency: String = "USD"
	
	var fetchingData: Bool = true
	var currencyData: CurrencyDataResponse = .emptyData()
	var formattedDateString: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		
		if let date = dateFormatter.date(from: currencyData.date) {
			let displayFormatter = DateFormatter()
			displayFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
			displayFormatter.timeZone = TimeZone.current
			return displayFormatter.string(from: date)
		} else {
			return "Invalid date format"
		}
	}
	
	init() {
		fetchCurrencyData()
	}
	
	private func fetchCurrencyData() {
		self.fetchingData = true
		
		APIService.fetchData(urlString: "https://api.fxratesapi.com/latest", responseType: CurrencyDataResponse.self) { response in
			self.currencyData = response
			self.fetchingData = false
		}
	}
}


// MARK: Public functions
extension ConversionViewModel {
	func flagEmoji(currency: String) -> String {
		return FlagEmoji.flagEmojis[currency] ?? "🇺🇸"
	}
	
	func convertCurrency(input: Double = 1, isTopSection: Bool) -> Double {
		guard let fromRate = currencyData.rates[isTopSection ? selectedCurrency : secondarySelectedCurrency], let toRate = currencyData.rates[isTopSection ? secondarySelectedCurrency : selectedCurrency] else {
			return 0
		}

		let conversionRate = fromRate / toRate

		return input / conversionRate
	}
	
	func refetchData() {
		fetchCurrencyData()
	}
}
