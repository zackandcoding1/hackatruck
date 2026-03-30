//
//  APIKey.swift
//  Aula07
//
//  Created by Turma01-8 on 26/03/26.
//

import Foundation

enum APIKey {
    static var `default`: String {
        let value = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
        return value
    }
}
