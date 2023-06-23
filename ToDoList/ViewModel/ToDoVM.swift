//
//  ToDoVM.swift
//  ToDoList
//
//  Created by Jeck Lee on 2023/06/13.
//

import Foundation
import RealmSwift

class ToDoItem: Object {
	private static var realm = try! Realm()
	
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
	
	// MARK: Realm
	fileprivate static func findAll() -> Results<ToDoItem> {
		realm.objects(ToDoItem.self)
	}
	fileprivate static func addItem(_ item: ToDoItem) {
		try! realm.write {
			realm.add(item)
		}
	}
	fileprivate static func removeItem(_ item: ToDoItem) {
		try! realm.write {
			realm.delete(item)
		}
	}
	func editItem(content: String? = nil, date: Date? = nil, isComplete: Bool? = nil) {
		try! ToDoItem.realm.write {
			if let content = content {
				self.content = content
			}
			if let date = date {
				self.date = date
			}
			if let isComplete = isComplete {
				self.isComplete = isComplete
			}
		}
	}
}

class ToDoVM: ObservableObject {
	@Published var items = [ToDoItem]()
	
	func getItems() {
		items = Array(ToDoItem.findAll())
	}
	
	func addItem(text: String) -> ToDoItem {
		let item = ToDoItem(content: text)
		items.append(item)
		ToDoItem.addItem(item)
		
		return item
	}
	
	func removeItem(idx: Int) {
		guard let item = items[safe: idx] else {
			return
		}
		// UI 업데이트는 ContentView의 List에서 onDelete 할 때 이뤄지므로 DB 데이터만 삭제해주면 됨
		// 중복 삭제할 경우 "Object has been deleted or invalidated." error
//		items.remove(at: idx)
		ToDoItem.removeItem(item)
	}
}
