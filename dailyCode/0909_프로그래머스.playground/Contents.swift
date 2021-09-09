import UIKit

// 0의 개수 확인하기
// 개수의 가장 낮은 수와 가장 높은 수
// 0을 제외한 숫자가 로또 번호와 몇개나 맞는지 확인
// 가장 높은 수와 맞은개수, 가장 낮은 수와 맞은 개수
// 숫자는 int타입

//struct LottosInt {
//    let number: UInt
//}

import Foundation

//7:30-8:00 30분, 테스트 1개 계속 틀림
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    if lottos.count >= 6 {
        return [6, 6]
    }
    
    let num = lottos.filter { num in
        num != 0
    }
    
    
    if num.count == 0 {
        return [1, 6]
    }
    
    
    let hit = num.filter { hit in
        win_nums.contains(hit)
    }
    
    let hitCount = hit.count
    let maxArray = lottos.filter { num in
        num == 0
    }
    
    let range = (0, maxArray.count)
    
    if hitCount == 0 {
        [7 - (range.0 + hitCount), maxArray.count ,6]
    }
    
    return [7 - (range.0 + hitCount), 7 - (range.1 + hitCount)].sorted()
}
