import UIKit
import RealmSwift

class ConditionViewController: UIViewController {
    
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var segment: UISegmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //背景画像の変更
        self.view.backgroundColor = UIColor.white
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "bg.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        //ナビゲーションバー
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: appDelegate.statusBarHeight!, width: appDelegate.screenWidth!, height: 70)
        let navItem : UINavigationItem = UINavigationItem(title: "食事時間")
        navItem.leftBarButtonItem = UIBarButtonItem(title: "←戻る", style: UIBarButtonItem.Style.plain, target: self,action:#selector(self.goToMain))
        navBar.pushItem(navItem, animated: true)
        view.addSubview(navBar)
        
        //ラベルを表示
        let text: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width: 300,height:50))
        text.text = "下記の項目を選択してください"
        text.layer.position = CGPoint(x: 200, y: 150)
        text.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(text)
        
        //食事の時間帯の選択
        //ボタンの表記を配列で作成
        let array = ["朝食","昼食","夕食"]
        segment = UISegmentedControl(items: array as [AnyObject])
        segment.selectedSegmentIndex = 0 //初期値は朝食
        segment.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        segment.frame = CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width: 300,height:50)
        self.view.addSubview(segment)
        
        //choiceへの遷移ボタン
        var nextButton:UIButton = UIButton()
        nextButton = UIButton(frame: CGRect(x: ((self.view.bounds.width-200)/2),y: 400,width: 200,height:50))
        nextButton.setTitle("決定", for: .normal)
        nextButton.layer.borderColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        nextButton.setTitleColor(UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), for: .normal)
        nextButton.layer.borderWidth = 1
        nextButton.layer.cornerRadius = 10.0
        nextButton.backgroundColor = UIColor.white
        nextButton.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //次の画面へ
    @objc func goNext(_ sender: UIButton) {
        //目的によるfoodの選択
        let realm = try! Realm()
        let user = realm.objects(User.self).first!
        if user.request == 0 || user.request == 1{
            appDelegate.foodId = Int(arc4random_uniform(15))
        }else{
            appDelegate.foodId = Int(arc4random(lower: 16, upper: 28))
        }
        print(appDelegate.foodId)
        
        //選択した時間を保存
        appDelegate.time = segment.selectedSegmentIndex
        self.present(ChoiceViewController(), animated: false, completion: nil)
    }
    
    //メインページに遷移
    @objc func goToMain(_ sender: UIButton) {
        self.present(MainViewController(), animated: false, completion: nil)
    }
    
    //範囲指定のランダム関数
    func arc4random(lower: UInt32, upper: UInt32) -> UInt32 {
        guard upper >= lower else {
            return 0
        }
        return arc4random_uniform(upper - lower) + lower
    }
}
