//
//  ColorFile.swift
//
//  Created by Jeck Lee on 2022/07/30.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
	convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 0xFF) {
		self.init(
			red: CGFloat(red) / 255.0,
			green: CGFloat(green) / 255.0,
			blue: CGFloat(blue) / 255.0,
			alpha: CGFloat(a) / 255.0
		)
	}
	
	/**
	 예시:  let color = UIColor(rgb: 0xFFFFFF)
	 */
	convenience init(rgb: Int) {
		self.init(
			red: (rgb >> 16) & 0xFF,
			green: (rgb >> 8) & 0xFF,
			blue: rgb & 0xFF
		)
	}
	
	/**
	 예시:  let color2 = UIColor(rgb: 0xFFFFFF, a: 0.5)
	 */
	convenience init(rgb: Int, a: CGFloat) {
		self.init(
			red: (rgb >> 16) & 0xFF,
			green: (rgb >> 8) & 0xFF,
			blue: rgb & 0xFF,
			a: a
		)
	}
	
	var color: Color {
		return Color(self)
	}
}

class ColorFile {
	static let background = UIColor(rgb: 0xF1F1F1)
	static let button = UIColor(rgb: 0xF0E1C7)
	static let cell = UIColor(rgb: 0xE8E8E8)
}
