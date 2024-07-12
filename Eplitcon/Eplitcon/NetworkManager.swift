//
//  NetworkManager.swift
//  Eplitcon
//
//  Created by iOS Developer on 11/07/24.
//
import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var user: User?

    func fetchUser() {
        guard let url = URL(string: "http://api.frenley.com/v2/profiles/testUser") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let user = try? decoder.decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        self.user = user
                    }
                }
            }
        }.resume()
    }
}



