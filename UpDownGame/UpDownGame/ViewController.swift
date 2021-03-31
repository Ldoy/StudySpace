//
//  ViewController.swift
//  UpDownGame
//
//  Created by Do Yi Lee on 2021/03/31.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderLabelValue: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    
    //slider를 변수로 설정
    @IBOutlet weak var slider: UISlider!
    // 왜 강제 언래핑?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        // image litteral 이용해 assect의 이미지 선택 가능
        // for는 언제 할 것인지묻는 것
        // 스토리 보드의 한계!! -> 스토리 보드로 100% 모든 것 구현 하는 것은 어려움
        reset()
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30)
    }

    //슬라이더 값을 가져오는(콘솔에) 코드
    @IBAction func slidervalueChanged(_ sender: UISlider) {
        print(sender.value)
    }

    //힛버튼 터치할 때 작동해야하는 코드
    @IBAction func touchUpHItButton(_ sender: UIButton) {
        print(slider.value)
    }
    /*아울렛은 인터페이스 빌더의 값을 가져와서 코드에 활용하고 싶을 때
    액션은 이벤트에 반응하기 위한 코드 가져와서 작성하고 싶을 때 */

    
    //reset button 이벤트에 관한 액션(코드)
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    // 혹시 typo 생긴다면 refactor에서 rename 진행
}


//레이블은 정보를 보여주는 뷰의 요소 -> 글꼴 정하게 되면 사용자가 글씨 크기 조절어려움 -> 이런것을 다이나믹 타입이라고 함!

