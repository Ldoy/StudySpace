import UIKit


enum Rsp {
	case rock(Int)
	case scissors(Int)
	case paper(Int)
	case etc(Int)
}


func filterUserInput() -> Int{
	//인트 이외의 값 나오면 잘못된 입력 출력하도록?
	let userinput = readLine()

	
	switch userinput {
	case "0" :
		print("잘못된 입력입니다")
		userinput
	case "1":
		return 1
	case "2":
		return 2
	case "3":
		return 3
	case nil:
		return
	}
	return -1
}

gameStart: while true {
	filterUserInput()

}


//
//enum 가위바위보: Int {
//    typealias RawValue = <#type#>
//
//
//    case 가위(String?) = 1
//
//    case 바위(String?) = 2
//    case 보(String?) = 3
//}
//
//가위바위보.가위
//
//
////CaseIterable라는 프로토콜 채용시 allCases 사용 가능
//
//let userInput = readLine()
//let d = 가위바위보.가위(userInput)
//
//enum Planet: Int {
//    case mercury = 1
//    case venus, earth
//}
//
//Planet.init(rawValue: 1)
//Planet.venus.rawValue
//
//let a = Int.random(in: 1...3)
//
//if let somePlanet = Planet(rawValue: a) {
//    switch somePlanet {
//    case .eath:
//        print("earth")
//    default:
//        print("A")
//    }
//}
//
//let puzzleInput = "great minds thick alike"
//var puzzleOutput = ""
//let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
//for character in puzzleInput {
//	if charactersToRemove.contains(character) {
//		continue
//	} else {
//		puzzleOutput.append(character)
//	}
//}
//
//print(puzzleOutput)
//
////
////let numberSympol: Character = "A"
////var possibleIntegerValue: Int?
////switch possibleIntegerValue {
////case "a":possibleIntegerValue = 1 //
////	<#code#>
////default:
////	<#code#>
////}
////
//
//func test(with x: Int) {
//
//}
//
//let tests = test(with: 5)
//
