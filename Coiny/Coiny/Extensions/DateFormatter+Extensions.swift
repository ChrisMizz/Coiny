//
//  DateFormatter+Extensions.swift
//  Coiny
//
//  Created by Christoffer Detlef on 30/06/2024.
//

import Foundation

extension DateFormatter {
	static let currencyDateFormat: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		return dateFormatter
	}()
	
	static let fetchedDateFormat: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMM d, yyyy 'at' HH:mm"
		return dateFormatter
	}()
}
