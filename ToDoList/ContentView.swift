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
				.padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 0))
			Spacer()
			Button(action: {
				try! Realm().write {
					item.isComplete.toggle()
				}
			}) {
				Image(item.isComplete ? "check_box-check" :  "check_box")
			}.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 18))
		}.listRowInsets(EdgeInsets())
			.listRowBackground(Color.clear)
			.listRowSeparator(.hidden)
			.frame(height: 44)
			.background(ColorFile.cell.color)
			.cornerRadius(18)
			.padding(EdgeInsets(top: 6, leading: 18, bottom: 6, trailing: 18))
	}
}

struct ContentView: View {
	let vm = ToDoVM()
	
	init() {
		vm.getItems()
	}
	
	@State var presentingModal = false
	
	var body: some View {
		
		VStack {
			List(vm.items, id: \.self) { item in
				ToDoCell(item: item)
			}.listStyle(.plain)
				.scrollContentBackground(.hidden)
			
			Button(action: {
				self.presentingModal.toggle()
			}) {
				HStack {
					Spacer()
					Image("add")
					Spacer()
				}
			}.sheet(isPresented: $presentingModal) { AddItemView() }
				.frame(height: 44)
				.background(ColorFile.button.color)
				.tint(.white)
				.cornerRadius(18)
				.padding(18)
		}.background(ColorFile.background.color)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
