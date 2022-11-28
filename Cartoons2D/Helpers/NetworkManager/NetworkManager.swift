//
//  NetworkManager.swift
//  Cartoons2D
//
//  Created by Amr Hassan on 28/11/2022.
//

import Foundation

class NetworkManager {
    
    var baseURL = "https://api.sampleapis.com/cartoons/cartoons2D"
    
    func getData(completion: @escaping (Result<HomeDataModel?, Error>) -> Void) {
        let url = URL(string: baseURL)
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("Error took place \(error)")
                return
            }
            if let data = data {
                do {
                    let postDetails = try JSONDecoder().decode(HomeDataModel.self, from: data)
                    completion(.success(postDetails))
                    print(postDetails)
                }
                catch let jsonError
                {
                    completion(.failure(jsonError))
                    print("error serializing json", jsonError)
                }
            }
        }
        task.resume()
    }
    
}
