//
//  CoinSwitchAPI.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation
#if canImport(Networking)
import Networking
#else
import Coinpaprika
#endif

public typealias CoinSwitchAPI = API

public struct API {
    private let credentials: Credentials
    private let baseUrl: URL = URL(string: "https://api.coinswitch.co/v2")!
    
    public init(key: String, userIp: String? = nil) {
        self.credentials = Credentials(key: key, ip: userIp)
    }
    
    public func getCoins() -> CoinSwitchRequest<[Coin]> {
        return CoinSwitchRequest<[Coin]>(baseUrl: baseUrl, method: .get, path: "coins", params: [:], credentials: credentials)
    }
    
    public func getPairs(depositCoin: String?, destinationCoin: String?) -> CoinSwitchRequest<[Pair]> {
        var params = [String: Any]()
        params["depositCoin"] = depositCoin
        params["destinationCoin"] = destinationCoin
        return CoinSwitchRequest<[Pair]>(baseUrl: baseUrl, method: .post, path: "pairs", params: params, credentials: credentials)
    }
    
    public func getRate(depositCoin: String?, destinationCoin: String?) -> CoinSwitchRequest<Rate> {
        var params = [String: Any]()
        params["depositCoin"] = depositCoin
        params["destinationCoin"] = destinationCoin
        return CoinSwitchRequest<Rate>(baseUrl: baseUrl, method: .post, path: "rate", params: params, credentials: credentials)
    }
    
    public func createOrder(params: NewOrderParams) -> CoinSwitchRequest<NewOrder> {
        return CoinSwitchRequest<NewOrder>(baseUrl: baseUrl, method: .post, path: "order", params: params.asDictionary ?? [:], credentials: credentials)
    }
    
    public func getOrder(id: String) -> CoinSwitchRequest<Order> {
        return CoinSwitchRequest<Order>(baseUrl: baseUrl, method: .get, path: "order/\(id)", params: [:], credentials: credentials)
    }
    
    public func getOrders() -> CoinSwitchRequest<ItemsList<Order>> {
        return CoinSwitchRequest<ItemsList<Order>>(baseUrl: baseUrl, method: .get, path: "orders", params: [:], credentials: credentials)
    }
}
