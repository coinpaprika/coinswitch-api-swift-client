//
//  NewOrderParams.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct NewOrderParams: Codable {
    public let depositCoin: String
    public let destinationCoin: String
    public let depositCoinAmount: Decimal?
    public let destinationCoinAmount: Decimal?
    public let destinationAddress: Account
    public let refundAddress: Account?
    
    public init(depositCoin: String, destinationCoin: String, depositCoinAmount: Decimal, destinationAddress: Account, refundAddress: Account? = nil) {
        self.depositCoin = depositCoin
        self.destinationCoin = destinationCoin
        self.depositCoinAmount = depositCoinAmount
        self.destinationCoinAmount = nil
        self.destinationAddress = destinationAddress
        self.refundAddress = refundAddress
    }
    
    public init(depositCoin: String, destinationCoin: String, destinationCoinAmount: Decimal, destinationAddress: Account, refundAddress: Account? = nil) {
        self.depositCoin = depositCoin
        self.destinationCoin = destinationCoin
        self.depositCoinAmount = nil
        self.destinationCoinAmount = destinationCoinAmount
        self.destinationAddress = destinationAddress
        self.refundAddress = refundAddress
    }
    
    var asDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any]
    }
}
