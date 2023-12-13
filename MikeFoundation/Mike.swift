//
//  Mike.swift
//  MikeFoundation
//
//  Created by Mike Donahue on 12/13/23.
//

import Foundation

public class Mike {
    public private(set) static var shared = Mike()
    public var isCool: Bool
    
    init() {
        isCool = false
    }
    
    public static func configure() {
        _ = Mike.shared
    }
}
