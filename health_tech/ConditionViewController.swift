import UIKit

class ConditionViewController: UIViewController {
    
    var nextButton1:UIButton = UIButton()
    var nextButton2:UIButton = UIButton()
    var nextButton3:UIButton = UIButton()
    
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var segment: UISegmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //ナビゲーションバー
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: appDelegate.statusBarHeight!, width: appDelegate.screenWidth!, height: 70)
        let navItem : UINavigationItem = UINavigationItem(title: "食事時間決定画面")
        navItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: UIBarButtonItem.Style.plain, target: self,action:#selector(self.goToMain))
        navBar.pushItem(navItem, animated: true)
        view.addSubview(navBar)
        
        //ラベルを表示
        let hoge: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width: 300,height:50))
        hoge.text = "下記の項目を選択してください"
        hoge.layer.position = CGPoint(x: 200, y: 150)
        hoge.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(hoge)
        
        //食事の時間帯の選択
        //ボタンの表記を配列で作成
        let array = ["朝食","昼食","夕食"]
        segment = UISegmentedControl(items: array as [AnyObject])
        segment.selectedSegmentIndex = 0
        segment.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        segment.frame = CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width: 300,height:50)
        self.view.addSubview(segment)
        
        //choiceへの遷移ボタン
//        nextButton1 = UIButton(frame: CGRect(x: ((self.view.bounds.width-200)/2),y: self.view.bounds.height-300,width: 200,height:50))
//        nextButton1.setTitle("普通", for: .normal)
//        nextButton1.setTitleColor(UIColor.black, for: .normal)
//        nextButton1.tintColor = UIColor.black
//        nextButton1.backgroundColor = UIColor.white
//        nextButton1.layer.borderColor = UIColor.black.cgColor
//        nextButton1.layer.borderWidth = 1
//        nextButton1.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
//        view.addSubview(nextButton1)
        
        //choiceへの遷移ボタン
//        nextButton2 = UIButton(frame: CGRect(x: ((self.view.bounds.width-200)/2),y: self.view.bounds.height-200,width: 200,height:50))
//        nextButton2.setTitle("お腹の調子が悪い", for: .normal)
//        nextButton2.setTitleColor(UIColor.black, for: .normal)
//        nextButton2.tintColor = UIColor.black
//        nextButton2.backgroundColor = UIColor.white
//        nextButton2.layer.borderColor = UIColor.black.cgColor
//        nextButton2.layer.borderWidth = 1
//        nextButton2.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
//        view.addSubview(nextButton2)
        
        //choiceへの遷移ボタン
        nextButton3 = UIButton(frame: CGRect(x: ((self.view.bounds.width-200)/2),y: self.view.bounds.height-100,width: 200,height:50))
        nextButton3.setTitle("決定", for: .normal)
        nextButton3.setTitleColor(UIColor.black, for: .normal)
        nextButton3.tintColor = UIColor.black
        nextButton3.backgroundColor = UIColor.white
        nextButton3.layer.borderColor = UIColor.black.cgColor
        nextButton3.layer.borderWidth = 1
        nextButton3.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton3)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //次の画面へ
    @objc func goNext(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        appDelegate.time = segment.selectedSegmentIndex
        let nextvc = ChoiceViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
    
    //メインページに遷移
    @objc func goToMain(_ sender: UIButton) {
        self.present(MainViewController(), animated: true, completion: nil)
    }
}
