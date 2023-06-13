//
//  ToDoVM.swift
//  ToDoList
//
//  Created by Jeck Lee on 2023/06/13.
//

import Foundation

class ToDoItem {
	var id: String
	var content: String
	var date: Date
	var isComplete: Bool
	
	fileprivate init(content: String) {
		self.id = "\(Date())"
		self.content = content
		self.date = Date()
		self.isComplete = false
	}
}

class ToDoVM {
	var items = [ToDoItem]()
	
	func getItems() {
		// TODO: Load data from DB
		// Test Data
		for i in 0..<5 {
			items.append(ToDoItem(content: "Test Item \(i)"))
		}
	}
	
	func addItem(text: String) -> ToDoItem {
		let item = ToDoItem(content: text)
		items.append(item)
		
		return item
	}
	
	func removeItem(idx: Int) {
		items.remove(at: idx)
	}
}
