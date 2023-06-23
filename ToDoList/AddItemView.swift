//
//  AddItemView.swift
//  ToDoList
//
//  Created by Jeck Lee on 2023/06/23.
//

import UIKit
import SwiftUI

struct AddItemView: View {
	@Environment(\.dismiss) var dismiss
	@State private var todo: String = ""
	
	var body: some View {
		VStack(alignment: .leading) {
			Spacer()
			Text("할 일 입력").padding(.leading, 18)
			TextField("Enter your ToDo", text: $todo)
				.padding(.top, 12)
				.padding(.bottom, 12)
					.background(.white)
					.frame(alignment: .leading)
					.padding(.leading, 18)
					.padding(.trailing, 18)
			Spacer()
			Button(action: {
				dismiss()
			}) {
				HStack {
					Spacer()
					Text("확인")
					Spacer()
				}
			}.frame(height: 44)
				.background(ColorFile.button.color)
				.tint(.white)
				.cornerRadius(18)
				.padding(18)
		}.background(ColorFile.background.color)
			.presentationDetents([.medium])
			.presentationDragIndicator(.visible)
	}
}

struct AddItemView_Previews: PreviewProvider {
	static var previews: some View {
		AddItemView()
	}
}
