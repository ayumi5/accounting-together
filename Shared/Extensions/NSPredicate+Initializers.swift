//
//  NSPredicate+Initializers.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/20.
//

import Foundation


extension NSPredicate {
    private convenience init(expression property: String, _ operation: String, _ value: AnyObject) {
        self.init(format: "\(property) \(operation) %@", argumentArray: [value])
    }
    
    public convenience init(_ property: String, equal value: AnyObject) {
        self.init(expression: property, "=", value)
    }
    
    public convenience init(_ property: String, notEqual value: AnyObject) {
        self.init(expression: property, "!=", value)
    }
    
    public convenience init(_ property: String, equalOrGreaterThan value: AnyObject) {
        self.init(expression: property, ">=", value)
    }
    
    public convenience init(_ property: String, equalOrLessThan value: AnyObject) {
        self.init(expression: property, "<=", value)
    }
    
    public convenience init(_ property: String, greaterThan value: AnyObject) {
        self.init(expression: property, ">", value)
    }
    
    public convenience init(_ property: String, lessThan value: AnyObject) {
        self.init(expression: property, "<", value)
    }
    
    public convenience init(_ property: String, contains q: String) {
        self.init(format: "\(property) CONTAINS '\(q)'")
    }
    
    public convenience init(_ property: String, beginsWith q: String) {
        self.init(format: "\(property) BEGINSWITH '\(q)'")
    }
    
    public convenience init(_ property: String, endsWith q: String) {
        self.init(format: "\(property) ENDSWITH '\(q)'")
    }
    
    public convenience init(_ property: String, between min: AnyObject, to max: AnyObject) {
        self.init(format: "\(property) BETWEEN {%@, %@}", argumentArray: [min, max])
    }
    
    public convenience init(_ property: String, fromDate: NSDate?, toDate: NSDate?) {
        var format = "", args = [AnyObject]()
        if let from = fromDate {
            format += "\(property) >= %@"
            args.append(from)
        }
        if let to = toDate {
            if !format.isEmpty {
                format += " AND "
            }
            format += "\(property) <= %@"
            args.append(to)
        }
        if !args.isEmpty {
            self.init(format: format, argumentArray: args)
        } else {
            self.init(value: true)
        }
    }
}
