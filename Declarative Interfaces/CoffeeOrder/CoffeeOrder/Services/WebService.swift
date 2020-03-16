//
//  WebService.swift
//  CoffeeOrder
//
//  Created by Terry Dengis on 10/31/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

class WebService {
    
    let URL_STRING = "https://island-bramble.glitch.me/orders"
    
    func createOrder (order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        
        guard let url = URL(string: URL_STRING) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest (url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder ().encode(order)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion (nil)
                }
                return
            }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion (createOrderResponse)
            }
            
        }.resume()
    }
    
    func getAllOrders (completion: @escaping ([Order]?) -> ()) {
        
        guard let url = URL (string: URL_STRING) else {
            completion (nil)
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            guard let data = data, error == nil else {
                
                DispatchQueue.main.async {
                    completion (nil)
                }
                return
            }
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion (orders)
            }
            
            
        }.resume()
    }
}
