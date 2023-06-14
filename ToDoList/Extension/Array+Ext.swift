//
//  Array+Ext.swift
//  AptThermostatCtrl
//
//  Created by Jeck Lee on 2022/10/29.
//

import Foundation

extension Array {
	// array[i]로 객체를 꺼내올 때, 해당 index가 실존하지 않을 경우 앱 crash. 방지하기 위해 사용.
	// 사용예시: samProfiles[safe: indexPath.row]
	subscript (safe index: Int) -> Element? {
		return indices ~= index ? self[index] : nil
	}
}
