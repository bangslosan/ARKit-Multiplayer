//
//  Vertex.swift
//  ARKit Multiplayer Example
//
//  Created by Eugene Bokhan on 12/8/17.
//  Copyright © 2017 Eugene Bokhan. All rights reserved.
//

import CoreGraphics
import SceneKit

public final class Vertex {
    
    public let point: CGPoint
    public let scnVector: SCNVector3?
    // Идентификатор точки. От 0 до 67. Всего 68 значений для dlib. Либо 65 для vision
    public let identifier: Int
    
    public init(point: CGPoint, scnVector: SCNVector3?, id: Int) {
        self.point = point
        self.scnVector = scnVector
        self.identifier = id
    }
    
}

extension Vertex: Equatable {
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.point.x == rhs.point.x && lhs.point.y == rhs.point.y
    }
}

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}

extension Vertex: Hashable {
    public var hashValue: Int {
        var seed = UInt(0)
        hash_combine(seed: &seed, value: UInt(bitPattern: point.x.hashValue))
        hash_combine(seed: &seed, value: UInt(bitPattern: point.y.hashValue))
        return Int(bitPattern: seed)
    }
}
