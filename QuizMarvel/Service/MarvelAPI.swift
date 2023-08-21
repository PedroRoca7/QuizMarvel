//
//  MarvelAPI.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI{
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    //  Caso queira usar sua chave privada da Marvel coloque sua chave privada aqui.
    static private let privateKey = ProcessInfo.processInfo.environment["MARVEL_API_PRIVATE_KEY"]
    //  Caso queira usar sua chave publica da Marvel coloque sua chave publica aqui.
    static private let publicKey = ProcessInfo.processInfo.environment["MARVEL_API_PUBLIC_KEY"]
    static private let limit = 1
    
    class func loadHero(name: String, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = 0
        let name = "name=\(name.replacingOccurrences(of: " ", with: "%20"))&"
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + name + getCredentials()
        
        AF.request(url).responseDecodable(of: MarvelInfo.self) { response in
            switch response.result {
                case let .success(data):
                    onComplete(data)
                case .failure:
                    onComplete(nil)
            }
         }
        
    }
    
    private class func getCredentials() -> String {
        guard let publicKey = publicKey, let privateKey = privateKey else { return "" }
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
