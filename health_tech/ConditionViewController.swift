import UIKit

class ConditionViewController: UIViewController {
    
    var nextButton1:UIButton = UIButton()
    var nextButton2:UIButton = UIButton()
    var nextButton3:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let hoge: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width: 300,height:50))
        hoge.text = "下記の項目を選択してください"
        hoge.layer.position = CGPoint(x: 200, y: 50)
        hoge.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(hoge)
        
        //食事の時間帯の選択
        //ボタンの表記を配列で作成
        let array = ["朝食","昼食","夕食"]
        //UISegmentedControlのインスタンス作成
        let segment: UISegmentedControl = UISegmentedControl(items: array as [AnyObject])
        //segmentの位置を設定
        segment.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        segment.frame = CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width: 300,height:50)
        //ボタンを押した時の処理を設定
        segment.addTarget(self, action: #selector(ConditionViewController.change(segment:)), for: UIControl.Event.valueChanged)
        //ViewにsegmentをsubViewとして追加
        self.view.addSubview(segment)
        
        //choiceへの遷移ボタン
        nextButton1 = UIButton(frame: CGRect(x: ((self.view.bounds.width-200)/2),y: self.view.bounds.height-300,width: 200,height:50))
        nextButton1.isEnabled = false
        nextButton1.setTitle("普通", for: .normal)
        nextButton1.setTitleColor(UIColor.black, for: .normal)
        nextButton1.tintColor = UIColor.black
        nextButton1.backgroundColor = UIColor.white
        nextButton1.layer.borderColor = UIColor.black.cgColor
        nextButton1.layer.borderWidth = 3
        nextButton1.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton1)
        
        //choiceへの遷移ボタン
        nextButton2 = UIButton(frame: CGRect(x: ((self.view.bounds.width-200)/2),y: self.view.bounds.height-200,width: 200,height:50))
        nextButton2.isEnabled = false
        nextButton2.setTitle("お腹の調子が悪い", for: .normal)
        nextButton2.setTitleColor(UIColor.black, for: .normal)
        nextButton2.tintColor = UIColor.black
        nextButton2.backgroundColor = UIColor.white
        nextButton2.layer.borderColor = UIColor.black.cgColor
        nextButton2.layer.borderWidth = 3
        nextButton2.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton2)
        
        //choiceへの遷移ボタン
        nextButton3 = UIButton(frame: CGRect(x: ((self.view.bounds.width-200)/2),y: self.view.bounds.height-100,width: 200,height:50))
        nextButton3.isEnabled = false
        nextButton3.setTitle("食欲ない", for: .normal)
        nextButton3.setTitleColor(UIColor.black, for: .normal)
        nextButton3.tintColor = UIColor.black
        nextButton3.backgroundColor = UIColor.white
        nextButton3.layer.borderColor = UIColor.black.cgColor
        nextButton3.layer.borderWidth = 3
        nextButton3.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton3)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = ChoiceViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
    //ボタンを押した時の処理
    @objc func change(segment:UISegmentedControl){
        
        //ボタンごとの処理をswitch文で処理
        switch segment.selectedSegmentIndex {
            
        case 0:
            nextButton1.isEnabled = true
            nextButton2.isEnabled = true
            nextButton3.isEnabled = true
        case 1:
            nextButton1.isEnabled = true
            nextButton2.isEnabled = true
            nextButton3.isEnabled = true
        case 2:
            nextButton1.isEnabled = true
            nextButton2.isEnabled = true
            nextButton3.isEnabled = true
        default:
            print("???")
        }
    }
}
