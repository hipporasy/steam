//
//  Store.swift
//  Steam
//
//  Created by Marasy Phi on 30/12/22.
//

import Foundation

struct Store: Identifiable, Hashable {
    
    var id: UUID { .init() }
    
    let title: String
    let subtitle: String
    let image: String 
    let price: Double
    let discount: Double
    
    var discountedPrice: Double {
        return (price - (price * discount)).rounded(toPlaces: 2)
    }

    static let features: [Store] = [
    
        .init(title: "Dead by Daylight", subtitle: "Recommended by your friend, Jägermeister", image: "dbd", price: 18.0, discount: 0.7),
        .init(title: "Grounded", subtitle: "Survival", image: "grounded", price: 29.99, discount: 0.2),
        .init(title: "Destiny 2", subtitle: "Having fun with your friends on the hunt", image: "d2", price: 99.99, discount: 0.3),
        .init(title: "Borderland 3", subtitle: "Did you miss game of the year?", image: "borderland", price: 59.99, discount: 0.5),
        
    ]
    
    static let items: [Store] = [
        .init(title: "GTA V", subtitle: "The old gang", image: "gta", price: 19.99, discount: 0),
        
        .init(title: "Battlefield IV", subtitle: "The old gang", image: "bf4", price: 69.99, discount: 0),
        
            .init(title: "Factorio", subtitle: "Recommended by your friend, Jägermeister", image: "factorio", price: 7.99, discount: 0.7),
        .init(title: "Horizon Zero Dawn", subtitle: "Survival", image: "horizon", price: 29.99, discount: 0.2),
        .init(title: "PUBG", subtitle: "Having fun with your friends on the hunt", image: "pubg", price: 29.99, discount: 0.3),
        .init(title: "Rainbow Six Siege", subtitle: "Did you miss game of the year?", image: "r6", price: 59.99, discount: 0.5),

        
    ]
    
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
