//
//  Dictionary+Misc.swift
//  Hibari
//
//  Created by rb_de0 on 2017/02/02.
//
//

import Foundation

extension Dictionary {
    
    init(pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
    
    func filterPairs(_ includeElement: (Element) throws -> Bool) rethrows -> [Key: Value] {
        return Dictionary(pairs: try filter(includeElement))
    }
    
    func mapPairs<OutKey: Hashable, OutValue>(_ transform: (Element) throws -> (OutKey, OutValue)) rethrows -> [OutKey: OutValue] {
        return Dictionary<OutKey, OutValue>(pairs: try map(transform))
    }

}
