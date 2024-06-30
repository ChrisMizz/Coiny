//
//  APIService.swift
//  Coiny
//
//  Created by Christoffer Detlef on 27/06/2024.
//

import Foundation
import Combine

class APIService {
	private static var subscriptions = Set<AnyCancellable>()

	static func fetchData<T: Decodable>(urlString: String, responseType: T.Type, completion: @escaping (T) -> Void) {
		guard let url = URL(string: urlString) else { return }
		
		URLSession.shared.dataTaskPublisher(for: url)
			.map { $0.data }
			.decode(type: responseType, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.sink { completion in
				if case let .failure(error) = completion {
					print("Error fetching data: \(error.localizedDescription)")
				}
			} receiveValue: { response in
				completion(response)
			}.store(in: &subscriptions)
	}
}
