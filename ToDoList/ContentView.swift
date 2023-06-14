//
//  ContentView.swift
//  ToDoList
//
//  Created by Jeck Lee on 2023/06/13.
//

import SwiftUI
import RealmSwift

struct ToDoCell: View {
	var item: ToDoItem
	
	var body: some View {
		HStack {
			Text(item.content)
				.foregroundColor(item.isComplete ? .gray : .black)
			Spacer()
			Button(action: {
				try! Realm().write {
					item.isComplete.toggle()
				}
			}) {
				Image(item.isComplete ? "check_box-check" :  "check_box")
			}
		}
	}
}

struct ContentView: View {
	let vm = ToDoVM()
	
	init() {
		vm.getItems()
	}
	
    var body: some View {
		List(vm.items, id: \.self) { item in
			ToDoCell(item: item)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
