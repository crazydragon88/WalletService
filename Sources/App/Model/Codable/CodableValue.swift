//
// Created by Ken on 22/08/2023.
//

import Vapor
import Fluent

enum CodableValue: Content{
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case nested([String: CodableValue])
    case array([CodableValue])
    // add more cases if needed

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else if let double = try? container.decode(Double.self) {
            self = .double(double)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let nested = try? container.decode([String: CodableValue].self) {
            self = .nested(nested)
        } else  if let array = try? container.decode([CodableValue].self) {
            self = .array(array)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown type")
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        case .nested(let value):
            try container.encode(value)
        case .array(let values):
            try container.encode(values)
        }
    }
}

extension CodableValue {
    var string: String? {
        if case .string(let value) = self { return value }
        return nil
    }
    var int: Int? {
        if case .int(let value) = self { return value }
        return nil
    }
    var double: Double? {
        if case .double(let value) = self { return value }
        return nil
    }
    var bool: Bool? {
        if case .bool(let value) = self { return value }
        return nil
    }
    var nested: [String: CodableValue]? {
        if case .nested(let value) = self { return value }
        return nil
    }
    var array: [CodableValue]? {
        if case .array(let value) = self { return value }
        return nil
    }

    var value: Any {
        switch self {
        case .string(let value):
            return value
        case .int(let value):
            return value
        case .double(let value):
            return value
        case .bool(let value):
            return value
        case .nested(let value):
            return value
        case .array(let value):
            return value
        }
    }
}
