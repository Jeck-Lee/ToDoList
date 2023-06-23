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
				item.editItem(isComplete: !item.isComplete)
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
	@ObservedObject var vm = ToDoVM()
	
	init() {
		vm.getItems()
	}
	
	@State var presentingModal = false
	@State var preItem: ToDoItem? = nil
	
	var body: some View {
		
		VStack {
			List{ ForEach(vm.items, id: \.self) { item in
				ToDoCell(item: item)
					.onTapGesture {
						preItem = item
						presentingModal.toggle()
					}
			}.onDelete { indexSet in
				delete(at: indexSet)
			}}.listStyle(.plain)
				.scrollContentBackground(.hidden)
				.refreshable {
					vm.getItems()
				}
			
			Button(action: {
				presentingModal.toggle()
			}) {
				HStack {
					Spacer()
					Image("add")
					Spacer()
				}
			}.sheet(isPresented: $presentingModal) {
				AddItemView(vm: vm, preItem: preItem)
			}
				.frame(height: 44)
				.background(ColorFile.button.color)
				.tint(.white)
				.cornerRadius(18)
				.padding(18)
		}.background(ColorFile.background.color)
	}
	
	private func delete(at offsets: IndexSet) {
		if let index = offsets.first {
			vm.removeItem(idx: index)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
