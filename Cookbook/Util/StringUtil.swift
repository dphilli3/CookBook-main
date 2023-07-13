//
//  StringUtil.swift
//  CookBook
//
//  Created by Dakota Phillips on 7/12/23.
//

import Foundation

extension String {
    func isTrimmedEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
