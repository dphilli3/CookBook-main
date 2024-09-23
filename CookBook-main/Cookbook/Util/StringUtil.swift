//
//  StringUtil.swift
//  CookBook
//
//  Created by Dakota Phillips on 9/23/24.
//

import Foundation

extension String {
    func isTrimmedEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
