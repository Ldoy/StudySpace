import Foundation


//1,2,3번 문제의 정답개수가 같은 경우는 구현하지 못함 
func solution(_ answers:[Int]) -> [Int] {
	let answer = (
		one: [1,2,3,4,5], two: [2,1,2,3,2,4,2,5], three: [3,3,1,1,2,2,4,4,5,5]
	)
	
	var one = 0
	var two = 0
	var three = 0
	
	var result = [Int:Int]()
	
	for i in 0...answers.count {
		if answer.one[i % 5] == answers[i] {
			one += 1
		}
		if answer.two[i % 8] == answers[i] {
			two += 1
		}
		if answer.three[i & 10] == answers[i] {
			three += 1
		}
	}
	
	result = [one:1, two:2, three:3]
	
	result.keys.sorted()
	
	let results = [result.first!.value]
	
	return results
	
}

