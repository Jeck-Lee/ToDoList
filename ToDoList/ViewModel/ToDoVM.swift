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
	
	init(content: String) {
		self.id = "\(Date())"
		self.content = content
		self.date = Date()
		self.isComplete = false
	}
}

class ToDoVM {
	var items = [ToDoVM]()
	
	func getItems() {
		
	}
	
	func addItem() {
		
	}
	
	func removeItem() {
		
	}
}
