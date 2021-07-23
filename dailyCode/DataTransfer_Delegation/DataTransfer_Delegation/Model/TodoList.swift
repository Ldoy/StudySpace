//
//  TodoList.swift
//  DataTransfer_Delegation
//
//  Created by Do Yi Lee on 2021/07/23.
//

import Foundation

enum CellType: String {
    case coding
    case english
    case travelPlace
}

class TodoListItems {
    // section : 3개 - 코딩, 영어, 여행
    // 섹션마다 헤더, 셀에들어갈 아이템(label의 이름)을 가진다
    // 셀의 아이템은 배열타입으로 구현
    // cell의 아이덴티 파이어 enum으로
    
    init(type: CellType, title: String) {
        self.type = type
        self.title = title
    }
    let title: String
    let type: CellType
}

class TodoListSections {
    init( items: [TodoListItems], headers: String, footers: String) {
        self.items = items
        self.footers = footers
        self.headers = headers
    }
    let items: [TodoListItems]
    let footers: String
    let headers: String
    
    static func generateData() -> [TodoListSections] {
        let list = [TodoListSections(items: [TodoListItems(type: .coding, title: "tableView"), TodoListItems(type: .coding, title: "Delegate Pattern"), TodoListItems(type: .coding, title: "life cycle Method")], headers: "👩🏻‍💻", footers: "--------------"), TodoListSections(items: [TodoListItems(type: .english, title: "말하기연습")], headers: "🗣", footers: "--------------"), TodoListSections(items: [TodoListItems(type: .travelPlace, title: "독일")], headers: "🏕", footers: "--------------")]
        return list
    }
}


