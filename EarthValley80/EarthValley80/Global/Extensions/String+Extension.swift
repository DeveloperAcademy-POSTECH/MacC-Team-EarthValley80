//
//  String+Extension.swift
//  EarthValley80
//
//  Created by Lee Myeonghwan on 2023/01/10.
//

extension String {
    
    func stringTokens(separatedBy: Set<String>) -> [String] {
        var token = ""
        var tokens: [String] = []
        for chracter in self {
            if separatedBy.contains(String(chracter)) {
                token += String(chracter)
                tokens.append(token)
                token = ""
            }
            else {
                token += String(chracter)
            }
        }
        return tokens
    }
    
}
