//
//  String+Extension.swift
//  TodoApp
//
//  Created by Anup Saud on 2024-09-10.
//

import Foundation
extension String{
    var isEmptyorWhiteSpace: Bool{
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
