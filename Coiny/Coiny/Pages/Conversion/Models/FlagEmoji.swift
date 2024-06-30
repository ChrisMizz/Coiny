//
//  FlagEmoji.swift
//  Coiny
//
//  Created by Christoffer Detlef on 15/06/2024.
//

import Foundation
class FlagEmoji {
	static let flagEmojis: [String: String] = [
		"KRW": "🇰🇷",
		"CDF": "🇨🇩",
		"TWD": "🇹🇼",
		"MXN": "🇲🇽",
		"CLF": "🇨🇱",
		"XPT": "🌐", // Platinum (generic globe emoji as no specific flag)
		"ZMK": "🇿🇲",
		"COP": "🇨🇴",
		"CZK": "🇨🇿",
		"NIO": "🇳🇮",
		"OMR": "🇴🇲",
		"SAR": "🇸🇦",
		"HKD": "🇭🇰",
		"CUP": "🇨🇺",
		"GHS": "🇬🇭",
		"BDT": "🇧🇩",
		"BOB": "🇧🇴",
		"MVR": "🇲🇻",
		"MMK": "🇲🇲",
		"BZD": "🇧🇿",
		"SEK": "🇸🇪",
		"AWG": "🇦🇼",
		"XDR": "🌐", // IMF Special Drawing Rights (generic globe emoji as no specific flag)
		"MDL": "🇲🇩",
		"DJF": "🇩🇯",
		"ARS": "🇦🇷",
		"RWF": "🇷🇼",
		"GNF": "🇬🇳",
		"ADA": "🌐", // Cardano (generic globe emoji as no specific flag)
		"TND": "🇹🇳",
		"ILS": "🇮🇱",
		"MKD": "🇲🇰",
		"BBD": "🇧🇧",
		"LYD": "🇱🇾",
		"EUR": "🇪🇺",
		"UAH": "🇺🇦",
		"LRD": "🇱🇷",
		"FJD": "🇫🇯",
		"TMT": "🇹🇲",
		"SGD": "🇸🇬",
		"SRD": "🇸🇷",
		"VND": "🇻🇳",
		"CVE": "🇨🇻",
		"RSD": "🇷🇸",
		"UZS": "🇺🇿",
		"IQD": "🇮🇶",
		"HTG": "🇭🇹",
		"MZN": "🇲🇿",
		"BNB": "🌐", // Binance Coin (generic globe emoji as no specific flag)
		"USD": "🇺🇸",
		"INR": "🇮🇳",
		"ZAR": "🇿🇦",
		"LAK": "🇱🇦",
		"PKR": "🇵🇰",
		"AFN": "🇦🇫",
		"LBP": "🇱🇧",
		"KWD": "🇰🇼",
		"AUD": "🇦🇺",
		"AZN": "🇦🇿",
		"SYP": "🇸🇾",
		"TRY": "🇹🇷",
		"XAU": "🌐", // Gold (generic globe emoji as no specific flag)
		"MWK": "🇲🇼",
		"TTD": "🇹🇹",
		"ALL": "🇦🇱",
		"BYR": "🇧🇾", // Note: Belarusian ruble (BYR) has been replaced by BYN, using same flag for consistency
		"UGX": "🇺🇬",
		"KPW": "🇰🇵",
		"MYR": "🇲🇾",
		"ISK": "🇮🇸",
		"XPD": "🌐", // Palladium (generic globe emoji as no specific flag)
		"AED": "🇦🇪",
		"VEF": "🇻🇪",
		"GMD": "🇬🇲",
		"GEL": "🇬🇪",
		"XRP": "🌐", // Ripple (generic globe emoji as no specific flag)
		"SOS": "🇸🇴",
		"XPF": "🇵🇫",
		"LSL": "🇱🇸",
		"AOA": "🇦🇴",
		"YER": "🇾🇪",
		"CAD": "🇨🇦",
		"TZS": "🇹🇿",
		"LKR": "🇱🇰",
		"OP": "🌐", // Optimism (generic globe emoji as no specific flag)
		"PEN": "🇵🇪",
		"TOP": "🇹🇴",
		"LTC": "🌐", // Litecoin (generic globe emoji as no specific flag)
		"HRK": "🇭🇷",
		"BSD": "🇧🇸",
		"DAI": "🌐", // Dai (generic globe emoji as no specific flag)
		"MUR": "🇲🇺",
		"BMD": "🇧🇲",
		"BRL": "🇧🇷",
		"BGN": "🇧🇬",
		"THB": "🇹🇭",
		"GGP": "🇬🇬",
		"DOT": "🌐", // Polkadot (generic globe emoji as no specific flag)
		"TJS": "🇹🇯",
		"IRR": "🇮🇷",
		"DOP": "🇩🇴",
		"XCD": "🇦🇬",
		"SBD": "🇸🇧",
		"MNT": "🇲🇳",
		"CLP": "🇨🇱",
		"JOD": "🇯🇴",
		"BIF": "🇧🇮",
		"ZWL": "🇿🇼",
		"VUV": "🇻🇺",
		"DZD": "🇩🇿",
		"XAG": "🌐", // Silver (generic globe emoji as no specific flag)
		"KES": "🇰🇪",
		"SVC": "🇸🇻",
		"PGK": "🇵🇬",
		"JMD": "🇯🇲",
		"BHD": "🇧🇭",
		"WST": "🇼🇸",
		"UYU": "🇺🇾",
		"QAR": "🇶🇦",
		"RON": "🇷🇴",
		"IMP": "🇮🇲",
		"IDR": "🇮🇩",
		"HNL": "🇭🇳",
		"PYG": "🇵🇾",
		"BTC": "🌐", // Bitcoin (generic globe emoji as no specific flag)
		"PAB": "🇵🇦",
		"SCR": "🇸🇨",
		"MGA": "🇲🇬",
		"AMD": "🇦🇲",
		"MOP": "🇲🇴",
		"LVL": "🇱🇻", // Note: Latvian lats (LVL) has been replaced by EUR, but using Latvian flag
		"KZT": "🇰🇿",
		"BND": "🇧🇳",
		"GYD": "🇬🇾",
		"XAF": "🇨🇲",
		"NPR": "🇳🇵",
		"GIP": "🇬🇮",
		"HUF": "🇭🇺",
		"NAD": "🇳🇦",
		"ZMW": "🇿🇲",
		"ETB": "🇪🇹",
		"SDG": "🇸🇩",
		"FKP": "🇫🇰",
		"NGN": "🇳🇬",
		"NZD": "🇳🇿",
		"KYD": "🇰🇾",
		"PLN": "🇵🇱",
		"GTQ": "🇬🇹",
		"EGP": "🇪🇬",
		"CRC": "🇨🇷",
		"JEP": "🇯🇪",
		"LTL": "🇱🇹", // Note: Lithuanian litas (LTL) has been replaced by EUR, but using Lithuanian flag
		"SOL": "🌐", // Solana (generic globe emoji as no specific flag)
		"SHP": "🇸🇭",
		"PHP": "🇵🇭",
		"JPY": "🇯🇵",
		"MRO": "🇲🇷", // Note: Mauritanian ouguiya (MRO) has been replaced by MRU, but using Mauritanian flag
		"KHR": "🇰🇭",
		"BWP": "🇧🇼",
		"BTN": "🇧🇹",
		"KMF": "🇰🇲",
		"ERN": "🇪🇷",
		"DKK": "🇩🇰",
		"GBP": "🇬🇧",
		"XOF": "🇸🇳",
		"ETH": "🌐", // Ethereum (generic globe emoji as no specific flag)
		"BAM": "🇧🇦",
		"SZL": "🇸🇿",
		"CNY": "🇨🇳",
		"ARB": "🌐", // Arbitrum (generic globe emoji as no specific flag)
		"CUC": "🇨🇺",
		"RUB": "🇷🇺",
		"MAD": "🇲🇦",
		"CHF": "🇨🇭",
		"STD": "🇸🇹",
		"BYN": "🇧🇾",
		"KGS": "🇰🇬",
		"SLL": "🇸🇱",
		"ANG": "🇳🇱",
		"NOK": "🇳🇴"
	]
	
	static var sortedFlags: [(key: String, value: String)] {
		flagEmojis.sorted { $0.key < $1.key }
	}
}
