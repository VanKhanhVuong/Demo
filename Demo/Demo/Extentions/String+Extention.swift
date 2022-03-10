//
//  String+Extention.swift
//  Demo
//
//  Created by admin on 08/03/2022.
// https://stackoverflow.com/questions/34454532/how-add-separator-to-string-at-every-n-characters-in-swift

import Foundation

extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
