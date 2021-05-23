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
    @IBOutlet weak var sliderValueLabel: UILabel!
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
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0/5"
        slider.maximumValue = 30
        slider.minimumValue = 0
        slider.value = 15
        //slider 공식 문서 확인해보기
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }

    //슬라이더 값을 가져오는(콘솔에) 코드
    @IBAction func slidervalueChanged(_ sender: UISlider) {
        print(sender.value)
        let sliderValue: Int = Int(sender.value)
        sliderValueLabel.text = String(sliderValue)
    }

    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    
    }
    
    
    
    
    //힛버튼 터치할 때 작동해야하는 코드
    @IBAction func touchUpHItButton(_ sender: UIButton) {
        print(slider.value)
        let hitButtonValue: Int = Int(slider.value)
        slider.value = Float(hitButtonValue)
        //서로 다른 타입의 변수를 다룰 때 어떻게 할 것인지 시사하고 있음 -> 정수로 바뀐 hit값을 slidervalue에 할당 (slider는 float type만 가능)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) /5"
        //시도 횟수 표시
        
        //강의 코드 다른 버전
        if randomValue == hitButtonValue {
            //print("YOU HIT!")
            showAlert(message: "You hit")
            reset()
        } else if tryCount >= 5 {
            //print("you lose")
            showAlert(message: "You lose")
            reset()
        }
        else if randomValue > hitButtonValue {
            slider.minimumValue = Float(hitButtonValue)
            minimumValueLabel.text = String(hitButtonValue)
        } else if randomValue < hitButtonValue {
            slider.maximumValue = Float(hitButtonValue)
            maximumValueLabel.text = String(hitButtonValue)
        }//  else로 바꾸면 if문
        
    
        /*
         원래 코드
         if tryCount == hitButtonValue {
            pinrt("You HIt!")
            return
         } <- 함수 완전히 끝내고 싶을 때 굿
         
         if trycount >= hitButtonValue {
            }
         */
        
        
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

