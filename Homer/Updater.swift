//
//  Updater.swift
//  Homer
//
//  Created by Marco Della Rocca on 09/05/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import Foundation

class Updater {
    static func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    static func get(_ last_fetch: Double, completion: @escaping ([String: Any]?) -> Void) {
        let json = ["last_fetch": last_fetch]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        let url = URL(string: "https://greenist-backend.herokuapp.com/update")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                (200 ... 299).contains(httpResponse.statusCode),
                let data = data else { return }
            let update = convertToDictionary(text: String(data: data, encoding: .utf8)!)!
            DispatchQueue.main.async {
                completion(update)
            }
        }.resume()
    }
}
