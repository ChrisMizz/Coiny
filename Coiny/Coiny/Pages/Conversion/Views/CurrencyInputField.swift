//
//  CurrencyInputField.swift
//  Coiny
//
//  Created by Christoffer Detlef on 01/07/2024.
//

import SwiftUI

struct CurrencyInputField: View {
	@Binding var value: Double?
	var field: FocusField
	@FocusState var focusedField: FocusField?

	var body: some View {
		TextField("0", value: $value, format: .number)
			.keyboardType(.decimalPad)
			.padding()
			.multilineTextAlignment(.center)
			.font(.system(size: 60))
			.focused($focusedField, equals: field)
	}
}

#Preview {
	CurrencyInputField(value: .constant(0), field: .topSection)
}
