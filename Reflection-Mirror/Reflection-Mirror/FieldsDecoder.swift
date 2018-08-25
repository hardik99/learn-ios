//
//  FieldsDecoder.swift
//  Reflection-Mirror
//
//  Created by yuaming on 2018. 8. 25..
//  Copyright © 2018년 yuaming. All rights reserved.
//

import Foundation

class FieldsDecoder: Decoder {
    var codingPath: [CodingKey] = []
    var userInfo: [CodingUserInfoKey: Any] = [:]
    var keys: [String] = []
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key: CodingKey {
        return KeyedDecodingContainer(KDC(self))
    }
    
    struct KDC<Key: CodingKey>: KeyedDecodingContainerProtocol {
        var codingPath: [CodingKey] = []
        var allKeys: [Key] = []
        let decoder: FieldsDecoder
        
        init(_ decoder: FieldsDecoder) {
            self.decoder = decoder
        }
        
        func contains(_ key: Key) -> Bool {
            return true
        }
        
        func decodeNil(forKey key: Key) throws -> Bool {
            decoder.keys.append(key.stringValue)
            return true
        }
        
        func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
            decoder.keys.append(key.stringValue)
            return false
        }
        
        func decode(_ type: String.Type, forKey key: Key) throws -> String {
            decoder.keys.append(key.stringValue)
            return ""
        }
        
        func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
            decoder.keys.append(key.stringValue)
            return 0
        }
        
        func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
            decoder.keys.append(key.stringValue)
            return try T(from: decoder)
        }
        
        func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
            fatalError()
        }
        
        func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
            fatalError()
        }
        
        func superDecoder() throws -> Decoder {
            fatalError()
        }
        
        func superDecoder(forKey key: Key) throws -> Decoder {
            fatalError()
        }
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        fatalError()
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        return SVDC(self)
    }
    
    struct SVDC: SingleValueDecodingContainer {
        var codingPath: [CodingKey] = []
        
        func decodeNil() -> Bool {
            return true
        }
        
        func decode(_ type: Bool.Type) throws -> Bool {
            return false
        }
        
        func decode(_ type: String.Type) throws -> String {
            return ""
        }
        
        func decode(_ type: Double.Type) throws -> Double {
            return 0
        }
        
        func decode(_ type: Float.Type) throws -> Float {
            return 0
        }
        
        func decode(_ type: Int.Type) throws -> Int {
            return 0
        }
        
        func decode(_ type: Int8.Type) throws -> Int8 {
            return 0
        }
        
        func decode(_ type: Int16.Type) throws -> Int16 {
            return 0
        }
        
        func decode(_ type: Int32.Type) throws -> Int32 {
            return 0
        }
        
        func decode(_ type: Int64.Type) throws -> Int64 {
            return 0
        }
        
        func decode(_ type: UInt.Type) throws -> UInt {
            return 0
        }
        
        func decode(_ type: UInt8.Type) throws -> UInt8 {
            return 0
        }
        
        func decode(_ type: UInt16.Type) throws -> UInt16 {
            return 0
        }
        
        func decode(_ type: UInt32.Type) throws -> UInt32 {
            return 0
        }
        
        func decode(_ type: UInt64.Type) throws -> UInt64 {
            return 0
        }
        
        func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
            return try T(from: decoder)
        }
        
        let decoder: FieldsDecoder
        init(_ decoder: FieldsDecoder) {
            self.decoder = decoder
        }
    }
}
