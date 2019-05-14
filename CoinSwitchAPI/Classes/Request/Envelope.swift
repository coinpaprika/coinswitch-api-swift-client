//
//  Envelope.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation
import CoinpaprikaAPI

internal struct Envelope<Model: Codable>: Codable, CodableModel {
    public let success: Bool
    public let code: String
    public let data: Model?
    public let msg: String?
    
    public static var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? {
        return .secondsSince1970
    }
}
