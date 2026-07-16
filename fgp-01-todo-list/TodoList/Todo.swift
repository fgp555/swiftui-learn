//
//  Todo.swift
//  TodoList
//
//  Created by m1 on 17/07/2026.
//
import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var completed: Bool = false
}
