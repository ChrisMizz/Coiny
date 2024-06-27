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
	private var subscriptions = Set<AnyCancellable>()
	
	var selectedCurrency: String = "EUR"
	var secondarySelectedCurrency: String = "USD"
	
	var currencyDataRates: [String: Double] = [:]
	
	var sortedFlags: [(key: String, value: String)] {
		flagEmojis.sorted { $0.key < $1.key }
	}
	
	init() {
		fetchData()
	}
	
	private func fetchData() {
		guard let url = URL(string: "https://api.fxratesapi.com/latest") else {
			return
		}
		
		URLSession.shared.dataTaskPublisher(for: url)
			.map { $0.data }
			.decode(type: CurrencyDataResponse.self, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.sink { completion in
				if case let .failure(error) = completion {
					print("Error fetching data: \(error.localizedDescription)")
				}
			} receiveValue: { response in
				self.currencyDataRates = response.rates
				print(response.rates)
			}
			.store(in: &subscriptions)
	}
}


// MARK: Public functions
extension ConversionViewModel {
	func flagEmoji(currency: String) -> String {
		return flagEmojis[currency] ?? "🇺🇸"
	}
	
	func convertCurrency(input: Double = 1, fromCurrency: String, toCurrency: String) -> Double {
		guard let fromRate = currencyDataRates[fromCurrency], let toRate = currencyDataRates[toCurrency] else {
			return 0
		}

		let conversionRate = fromRate / toRate

		return input / conversionRate
	}
}

struct CurrencyDataResponse: Decodable {
	let success: Bool
	let terms: String
	let privacy: String
	let timestamp: Int
	let date: String
	let base: String
	let rates: [String: Double]
}
