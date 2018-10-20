import UIKit
import RealmSwift

class MainViewController: UIViewController {
    var user:User = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //背景色を白にする
        self.view.backgroundColor = UIColor.white
        
        //ユーザー情報取得
        let realm = try! Realm()
        user = realm.objects(User.self).first!
        print(user)
        
        var Sex = ""
        if user.sex == true{
            Sex = "男"
        }else{
            Sex = "女"
        }
        var Request = ""
        if user.request == 0{
            Request = "偏りのない食事"
        }else if user.request == 1{
            Request = "痩せたい"
        }else{
            Request = "量を食べたい"
        }
        
        
        
        //ナビゲーションバー
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: appDelegate.statusBarHeight!, width: appDelegate.screenWidth!, height: 70)
        //ナビゲーションアイテムのタイトルを設定
        let navItem : UINavigationItem = UINavigationItem(title: "メイン画面")
        //ナビゲーションバー右のボタンを設定
        navItem.rightBarButtonItem = UIBarButtonItem(title: "編集", style: UIBarButtonItem.Style.plain, target: self,action:#selector(self.goToSetting))
        //ナビゲーションバーにアイテムを追加
        navBar.pushItem(navItem, animated: true)
        //Viewにナビゲーションバーを追加
        view.addSubview(navBar)
        
        let base: UILabel = UILabel(frame: CGRect(x: 0,y: 70,width: self.view.bounds.width,height:50))
        base.text = "基本情報"
        base.font = UIFont.systemFont(ofSize: 30)
        base.textColor = UIColor.white
        base.textAlignment = NSTextAlignment.center
        base.backgroundColor = UIColor.blue
        self.view.addSubview(base)
        
        let sex: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 130,width: self.view.bounds.width,height:50))
        sex.text = "性別:          \(Sex)"
        sex.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(sex)
        
        let height: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 170,width: self.view.bounds.width,height:50))
        height.text = "身長:          \(user.height)  cm"
        height.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(height)
        
        let weight: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 210,width: self.view.bounds.width,height:50))
        weight.text = "体重:          \(user.weight)    kg"
        weight.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(weight)
        
        let age: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 250,width: self.view.bounds.width,height:50))
        age.text = "年齢:          \(user.age)        歳"
        age.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(age)
        
        let request: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 290,width: self.view.bounds.width,height:50))
        request.text = "目的:   \(Request)        "
        request.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(request)
        
        let bmiScore: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 350,width: self.view.bounds.width,height:50))
        bmiScore.text = " BMI:         \(appDelegate.bmi_score)        "
        bmiScore.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(bmiScore)
        
        let bmi: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-230)/5),y: 390,width: self.view.bounds.width,height:50))
        bmi.text = "肥満度:           \(appDelegate.bmi)        "
        bmi.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(bmi)
        
        let required_cal: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-250)/10),y: 430,width: self.view.bounds.width,height:50))
        required_cal.text = "必要カロリー:  \(appDelegate.required_cal)  kcal     "
        required_cal.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(required_cal)
        
        
        let nextButton = UIButton()
        nextButton.frame = CGRect(x:((appDelegate.screenWidth!-200)/2),y:appDelegate.screenHeight!-80*2,width:200,height:100)
        nextButton.setTitle("食事をする", for: .normal)
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.tintColor = UIColor.black
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.borderWidth = 1
        nextButton.backgroundColor = UIColor.white
        nextButton.addTarget(self, action: #selector(MainViewController.goToCondition(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func goToSetting(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = SettingViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
    
    @objc func goToCondition(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = ConditionViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
}
