//
//  CurrencyDataResponse.swift
//  Coiny
//
//  Created by Christoffer Detlef on 27/06/2024.
//

import Foundation

struct CurrencyDataResponse: Decodable {
	let success: Bool
	let terms: String
	let privacy: String
	let timestamp: Int
	let date: String
	let base: String
	let rates: [String: Double]
	
	static func emptyData() -> CurrencyDataResponse {
		return CurrencyDataResponse(
			success: false,
			terms: "",
			privacy: "",
			timestamp: 0,
			date: "",
			base: "",
			rates: ["": 0]
		)
	}
}
