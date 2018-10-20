import UIKit
import RealmSwift

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    // 選択肢
    let dataList = ["偏りのない食事がしたい", "痩せたい", "量を食べたい"]
    let array = ["男性", "女性"]
    
    var user_flag = false
    var user:User = User()
    
    var sex = true
    var height:Double = 0
    var weight:Double = 0
    var age = 0
    var request = 0
    
    var segment: UISegmentedControl = UISegmentedControl()
    var HeightTextfield:UITextField = UITextField()
    var WeightTextfield:UITextField = UITextField()
    var AgeTextfield:UITextField = UITextField()
    var picker:UIPickerView = UIPickerView()
    var SaveButton:UIButton = UIButton()
    
    //@IBOutlet weak var HeightTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //背景の色を変える
        self.view.backgroundColor = UIColor.white
        
        //保存ボタンを非表示にする
        SaveButton.isEnabled = false
        
        //性別の入力
        segment = UISegmentedControl(items: array as [AnyObject])
        segment.selectedSegmentIndex = 0
        //segmentの位置を設定
        segment.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        segment.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 100,width:appDelegate.screenWidth!*0.7 ,height:40)
        //ボタンを押した時の処理を設定
        segment.addTarget(self, action: #selector(SettingViewController.change(segment:)), for: UIControl.Event.valueChanged)
        //ViewにsegmentをsubViewとして追加
        self.view.addSubview(segment)
        
        //数値入力
        let numberToolbar: UIToolbar = UIToolbar()
        numberToolbar.barStyle = UIBarStyle.blackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action:#selector(self.cancel)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Enter", style: UIBarButtonItem.Style.plain, target: self, action:#selector(self.enter))
        ]
        numberToolbar.sizeToFit()
        
        
        //身長の入力
        HeightTextfield.delegate = self
        HeightTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 180,width:appDelegate.screenWidth!*0.7 ,height:40)
        HeightTextfield.borderStyle = .roundedRect
        HeightTextfield.clearButtonMode = .whileEditing
        HeightTextfield.placeholder = "身長[cm]を入力してください"
        //数値のみの入力を受け付ける
        HeightTextfield.keyboardType = UIKeyboardType.numberPad
        HeightTextfield.inputAccessoryView = numberToolbar
        self.view.addSubview(HeightTextfield)
        
        //体重の入力
        WeightTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 260,width:appDelegate.screenWidth!*0.7 ,height:40)
        WeightTextfield.borderStyle = .roundedRect
        WeightTextfield.clearButtonMode = .whileEditing
        WeightTextfield.placeholder = "体重[kg]を入力してください"
        //数値のみの入力を受け付ける
        WeightTextfield.keyboardType = UIKeyboardType.numberPad
        WeightTextfield.inputAccessoryView = numberToolbar
        self.view.addSubview(WeightTextfield)
        
        //年齢の入力
        AgeTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 340,width:appDelegate.screenWidth!*0.7 ,height:40)
        AgeTextfield.borderStyle = .roundedRect
        AgeTextfield.clearButtonMode = .whileEditing
        AgeTextfield.placeholder = "年齢[歳]を入力してください"
        //数値のみの入力を受け付ける
        AgeTextfield.keyboardType = UIKeyboardType.numberPad
        AgeTextfield.inputAccessoryView = numberToolbar
        self.view.addSubview(AgeTextfield)
        
        //目的の入力
        let name: UILabel = UILabel(frame: CGRect(x: ((appDelegate.screenWidth!-200)/2),y: 420,width: 400,height:40))
        name.text = "目的を選択してください"
        name.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(name)
        // ピッカーの作成
        picker = UIPickerView(frame: CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 460,width:appDelegate.screenWidth!*0.7 ,height:100))
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(0, inComponent: 0, animated: true)
        self.view.addSubview(picker)
        
        //保存ボタン
        SaveButton.frame = CGRect(x:((appDelegate.screenWidth!-100)/2),y:600,width:100,height:50)
        SaveButton.setTitle("完了", for: .normal)
        SaveButton.layer.borderColor = UIColor.black.cgColor
        SaveButton.layer.borderWidth = 1
        SaveButton.setTitleColor(UIColor.black, for: .normal)
        SaveButton.tintColor = UIColor.black
        SaveButton.backgroundColor = UIColor.white
        SaveButton.addTarget(self, action: #selector(SettingViewController.save(_:)), for: .touchUpInside)
        view.addSubview(SaveButton)
        
        //ユーザー情報取得
        let realm = try! Realm()
        let users = realm.objects(User.self)
        print(users)
        if (users.count > 0){
            print("ユーザーデータが存在します")
            user = users.first!
            user_flag = true
            if(user.sex){
                segment.selectedSegmentIndex = 0
            }else{
                segment.selectedSegmentIndex = 1
            }
            HeightTextfield.text = String(user.height)
            WeightTextfield.text = String(user.weight)
            AgeTextfield.text = String(user.age)
            picker.selectRow(user.request, inComponent: 0, animated: true)

        }else{
            print("ユーザーデータが存在しません")
            user_flag = false
        }
        
        //ナビゲーションバー
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: appDelegate.statusBarHeight!, width: appDelegate.screenWidth!, height: 70)
        //ナビゲーションアイテムのタイトルを設定
        let navItem : UINavigationItem = UINavigationItem(title: "設定画面")
        if(user_flag){
            //ナビゲーションバー左のボタンを設定
            navItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: UIBarButtonItem.Style.plain, target: self,action:#selector(self.goToMain))
        }
        //ナビゲーションバーにアイテムを追加
        navBar.pushItem(navItem, animated: true)
        //Viewにナビゲーションバーを追加
        view.addSubview(navBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //メインページに遷移
    @objc func goToMain(_ sender: UIButton) {
        self.present(MainViewController(), animated: true, completion: nil)
    }
    
    //更新を押した時の処理
    @objc func change(segment:UISegmentedControl){
        //ボタンごとの処理をswitch文で処理
        switch segment.selectedSegmentIndex {
        //男性の時
        case 0:
            sex = true
        //女性の時
        case 1:
            sex = false
        default:
            break
        }
    }

    @objc func save(_ sender: UIButton) {
        //Realmオブジェクト生成
        let realm = try! Realm()
        
        //更新の時
        if(user_flag){
            try! realm.write {
                user.sex = sex
                user.height = height
                user.weight = weight
                user.age = age
                user.request = request
            }
            let users = realm.objects(User.self)
            print(users)
            print("ユーザー更新完了")
        //初回登録の時
        }else{
            //Realmへの書き込み
            try! realm.write {
                let user = User()
                user.sex = sex
                user.height = height
                user.weight = weight
                user.age = age
                user.request = request
                realm.add(user)
                print("ユーザー登録完了")
            }
        }
        //メイン画面へ遷移
        self.present(MainViewController(), animated: true, completion: nil)
    }
    
    // UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 表示する列数
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // アイテム表示個数を返す
        return dataList.count
    }
    // UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        return dataList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        request = row
        print(dataList[row])
    }
    
    @objc func cancel(_ sender: UIButton) {
        HeightTextfield.resignFirstResponder()
        WeightTextfield.resignFirstResponder()
        AgeTextfield.resignFirstResponder()
    }
    
    @objc func enter(_ sender: UIButton) {
        let strHeight : String = HeightTextfield.text ?? ""
        height = Double(strHeight) ?? 0
        let strWeight : String = WeightTextfield.text ?? ""
        weight = Double(strWeight) ?? 0
        let strAge : String = AgeTextfield.text ?? ""
        age = Int(strAge) ?? 0
        
        HeightTextfield.resignFirstResponder()
        WeightTextfield.resignFirstResponder()
        AgeTextfield.resignFirstResponder()
        
        if(height>0 && weight>0 && age>0){
            SaveButton.isEnabled = true;
        }
    }
}
