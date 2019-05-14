//
//  Credentials.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct Credentials {
    public let key: String
    public let ip: String

    internal func asHeaders() -> [String: String] {
        return [
            "x-api-key": key,
            "x-user-ip": ip
        ]
    }
}
