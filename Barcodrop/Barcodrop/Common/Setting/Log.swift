//
//  Log.swift
//  Barcodrop
//
//  Created by SG on 2022/01/28.
//

import Foundation

//    MARK: - Log

public class Log {
    static func any(_ message: Any, file: String = #file, line: Int = #line) {
        let file = (file as NSString).lastPathComponent
        // 시간, 메세지, 파일명, 라인 넘버 출력
        print("[Log] : \(message) (at \(file):\(line))")
    }
}
