//
//  ToDoVM.swift
//  ToDoList
//
//  Created by Jeck Lee on 2023/06/13.
//

import Foundation
import RealmSwift

class ToDoItem: Object {
	@Persisted(primaryKey: true) var id: String
	@Persisted var content: String
	@Persisted var date: Date
	@Persisted var isComplete: Bool
	
	convenience init(content: String) {
		self.init()
		self.id = "\(Date())"
		self.content = content
		self.date = Date()
		self.isComplete = false
	}
}

class ToDoVM {
	var items = [ToDoItem]()
	
	func getItems() {
		guard let realm = try? Realm() else {
			return
		}
		
		items = Array(realm.objects(ToDoItem.self))
	}
	
	func addItem(text: String) -> ToDoItem {
		let item = ToDoItem(content: text)
		items.append(item)
		
		guard let realm = try? Realm() else {
			return item
		}
		try? realm.write {
			realm.add(item)
		}
		
		return item
	}
	
	func removeItem(idx: Int) {
		guard let realm = try? Realm(), let item = items[safe: idx] else {
			return
		}
		items.remove(at: idx)
		
		try? realm.write {
			realm.delete(item)
		}
	}
}
