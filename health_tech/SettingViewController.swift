import UIKit
import RealmSwift

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    //入力で使う選択肢
    let sexDataSet = ["男性", "女性"]
    let requiredDataSet = ["バランスの良い食事", "痩せたい", "筋肉をつけたい"]
    //ユーザーデータに関する変数
    var user_flag = false
    var user:User = User()
    //入力された項目の変数
    var sex = true
    var height:Double = 0
    var weight:Double = 0
    var age = 0
    var request = 0
    //UI部品の宣言
    var segment: UISegmentedControl = UISegmentedControl()
    var HeightTextfield:UITextField = UITextField()
    var WeightTextfield:UITextField = UITextField()
    var AgeTextfield:UITextField = UITextField()
    var picker:UIPickerView = UIPickerView()
    var SaveButton:UIButton = UIButton()
    //AppDelegateの宣言
    var appDelegate:AppDelegate = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppDelegateのインスタンスを取得
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //背景画像の変更
        self.view.backgroundColor = UIColor.white
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "bg.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        //保存ボタンを非表示にする
        SaveButton.isEnabled = false
        
        //性別の入力
        segment = UISegmentedControl(items: sexDataSet as [AnyObject])
        segment.selectedSegmentIndex = 0 //初期値は男性
        
        segment.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 100,width:appDelegate.screenWidth!*0.7 ,height:40)
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
        HeightTextfield.placeholder = "身長を入力してください"
        //数値のみの入力を受け付ける
        HeightTextfield.keyboardType = UIKeyboardType.numberPad
        HeightTextfield.inputAccessoryView = numberToolbar
        self.view.addSubview(HeightTextfield)
        //単位
        let heightUnit: UILabel = UILabel(frame: CGRect(x: appDelegate.screenWidth!*0.7,y: 180,width: 30,height:40))
        heightUnit.text = "cm"
        heightUnit.textAlignment = NSTextAlignment.left
        self.view.addSubview(heightUnit)
        
        //体重の入力
        WeightTextfield.delegate = self
        WeightTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 260,width:appDelegate.screenWidth!*0.7 ,height:40)
        WeightTextfield.borderStyle = .roundedRect
        WeightTextfield.clearButtonMode = .whileEditing
        WeightTextfield.placeholder = "体重を入力してください"
        //数値のみの入力を受け付ける
        WeightTextfield.keyboardType = UIKeyboardType.numberPad
        WeightTextfield.inputAccessoryView = numberToolbar
        self.view.addSubview(WeightTextfield)
        //単位
        let weightUnit: UILabel = UILabel(frame: CGRect(x: appDelegate.screenWidth!*0.7,y: 260,width: 30,height:40))
        weightUnit.text = "kg"
        weightUnit.textAlignment = NSTextAlignment.left
        self.view.addSubview(weightUnit)
        
        //年齢の入力
        AgeTextfield.delegate = self
        AgeTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 340,width:appDelegate.screenWidth!*0.7 ,height:40)
        AgeTextfield.borderStyle = .roundedRect
        AgeTextfield.clearButtonMode = .whileEditing
        AgeTextfield.placeholder = "年齢を入力してください"
        //数値のみの入力を受け付ける
        AgeTextfield.keyboardType = UIKeyboardType.numberPad
        AgeTextfield.inputAccessoryView = numberToolbar
        self.view.addSubview(AgeTextfield)
        //単位
        let ageUnit: UILabel = UILabel(frame: CGRect(x: appDelegate.screenWidth!*0.7,y: 340,width: 30,height:40))
        ageUnit.text = "歳"
        ageUnit.textAlignment = NSTextAlignment.left
        self.view.addSubview(ageUnit)
        
        //目的の入力
        let target: UILabel = UILabel(frame: CGRect(x: ((appDelegate.screenWidth!-400)/2),y: 400,width: 400,height:40))
        target.text = "目的を選択してください"
        target.textAlignment = NSTextAlignment.center
        target.font = UIFont.systemFont(ofSize: 28)
        self.view.addSubview(target)
        // ピッカーの作成
        picker = UIPickerView(frame: CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 430,width:appDelegate.screenWidth!*0.7 ,height:100))
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(0, inComponent: 0, animated: true)
        self.view.addSubview(picker)
        
        //保存ボタン
        SaveButton.frame = CGRect(x:((appDelegate.screenWidth!-100)/2),y:(appDelegate.screenHeight!-100),width:100,height:50)
        SaveButton.setTitle("完了", for: .normal)
        SaveButton.layer.borderColor = UIColor.gray.cgColor
        SaveButton.setTitleColor(UIColor.gray, for: .normal)
        SaveButton.layer.borderWidth = 1
        SaveButton.setTitleColor(UIColor.black, for: .normal)
        SaveButton.layer.cornerRadius = 10.0
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
        navBar.frame = CGRect(x: 0, y: appDelegate.statusBarHeight!, width: appDelegate.screenWidth!, height: 100)
        let navItem : UINavigationItem = UINavigationItem(title: "設定画面")
        if(user_flag){
            navItem.leftBarButtonItem = UIBarButtonItem(title: "←戻る", style: UIBarButtonItem.Style.plain, target: self,action:#selector(self.goToMain))
        }
        navBar.pushItem(navItem, animated: true)
        view.addSubview(navBar)
        
        checkSaveButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //メインページに遷移
    @objc func goToMain(_ sender: UIButton) {
        self.present(MainViewController(), animated: false, completion: nil)
    }
    
    func checkSaveButton(){
        //入力データの取得
        let strHeight : String = HeightTextfield.text ?? ""
        height = Double(strHeight) ?? 0
        let strWeight : String = WeightTextfield.text ?? ""
        weight = Double(strWeight) ?? 0
        let strAge : String = AgeTextfield.text ?? ""
        age = Int(strAge) ?? 0
        //ボタンの確認
        if(height>0 && weight>0 && age>0){
            SaveButton.isEnabled = true;
            SaveButton.layer.borderColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0).cgColor
            SaveButton.setTitleColor(UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), for: .normal)
        }else{
            SaveButton.isEnabled = false;
            SaveButton.layer.borderColor = UIColor.gray.cgColor
            SaveButton.setTitleColor(UIColor.gray, for: .normal)
        }
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
        appDelegate.calculation()
        //メイン画面へ遷移
        self.present(MainViewController(), animated: false, completion: nil)
    }
    
    // UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 表示する列数
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // アイテム表示個数を返す
        return requiredDataSet.count
    }
    // UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        return requiredDataSet[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        request = row
    }
    
    @objc func cancel(_ sender: UIButton) {
        checkSaveButton()
        HeightTextfield.resignFirstResponder()
        WeightTextfield.resignFirstResponder()
        AgeTextfield.resignFirstResponder()
    }
    
    @objc func enter(_ sender: UIButton) {
        checkSaveButton()
        HeightTextfield.resignFirstResponder()
        WeightTextfield.resignFirstResponder()
        AgeTextfield.resignFirstResponder()
    }
}
