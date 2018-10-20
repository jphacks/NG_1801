import UIKit
import RealmSwift

class MainViewController: UIViewController {
    var user:User = User()
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
        navBar.frame = CGRect(x: 0, y: appDelegate.statusBarHeight!, width: appDelegate.screenWidth!, height: 100)
        //ナビゲーションアイテムのタイトルを設定
        let navItem : UINavigationItem = UINavigationItem(title: "基本情報")
        //ナビゲーションバー右のボタンを設定
        navItem.rightBarButtonItem = UIBarButtonItem(title: "編集", style: UIBarButtonItem.Style.plain, target: self,action:#selector(self.goToSetting))
        //ナビゲーションバーにアイテムを追加
        navBar.pushItem(navItem, animated: true)
        //Viewにナビゲーションバーを追加
        view.addSubview(navBar)
        
//        let base: UILabel = UILabel(frame: CGRect(x: 0,y: 70,width: self.view.bounds.width,height:50))
//        base.text = "基本情報"
//        base.font = UIFont.systemFont(ofSize: 30)
//        base.textColor = UIColor.white
//        base.textAlignment = NSTextAlignment.center
//        base.backgroundColor = UIColor.blue
//        self.view.addSubview(base)
        
        let fontSize:CGFloat = 22
        
        let sex: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 130,width: self.view.bounds.width,height:50))
        sex.text = "性別:          \(Sex)"
        sex.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(sex)
        
        let height: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 170,width: self.view.bounds.width,height:50))
        height.text = "身長:          \(user.height)  cm"
        height.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(height)
        
        let weight: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 210,width: self.view.bounds.width,height:50))
        weight.text = "体重:          \(user.weight)    kg"
        weight.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(weight)
        
        let age: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 250,width: self.view.bounds.width,height:50))
        age.text = "年齢:          \(user.age)        歳"
        age.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(age)
        
        let request: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 290,width: self.view.bounds.width,height:50))
        request.text = "目的:   \(Request)        "
        request.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(request)
        
        let bmiScore: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/5),y: 350,width: self.view.bounds.width,height:50))
        bmiScore.text = " BMI:         \(appDelegate.bmi_score)        "
        bmiScore.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(bmiScore)
        
        let bmi: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-230)/5),y: 390,width: self.view.bounds.width,height:50))
        bmi.text = "肥満度:           \(appDelegate.bmi)        "
        bmi.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(bmi)
        
        let required_cal: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-250)/10),y: 430,width: self.view.bounds.width,height:50))
        required_cal.text = "必要カロリー:  \(round(appDelegate.required_cal*10)/10)  kcal     "
        required_cal.font = UIFont.systemFont(ofSize: fontSize)
        self.view.addSubview(required_cal)
        
        
        let nextButton = UIButton()
        nextButton.frame = CGRect(x:((appDelegate.screenWidth!-200)/2),y:appDelegate.screenHeight!-80*2,width:200,height:50)
        nextButton.setTitle("食事をする", for: .normal)
        nextButton.layer.borderColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        nextButton.setTitleColor(UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), for: .normal)
        nextButton.layer.borderWidth = 1
        nextButton.layer.cornerRadius = 10.0
        nextButton.backgroundColor = UIColor.white
        nextButton.addTarget(self, action: #selector(MainViewController.goToCondition(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func goToSetting(_ sender: UIButton) {
        let nextvc = SettingViewController()
        self.present(nextvc, animated: false, completion: nil)
    }
    
    @objc func goToCondition(_ sender: UIButton) {
        let nextvc = ConditionViewController()
        self.present(nextvc, animated: false, completion: nil)
    }
}
