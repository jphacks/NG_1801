import UIKit
import RealmSwift

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //背景の色を変える
        self.view.backgroundColor = UIColor.white
        
        //性別の入力
        segment = UISegmentedControl(items: array as [AnyObject])
        segment.selectedSegmentIndex = 0
        //segmentの位置を設定
        segment.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        segment.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 100,width:appDelegate.screenWidth!*0.7 ,height:50)
        //ボタンを押した時の処理を設定
        segment.addTarget(self, action: #selector(SettingViewController.change(segment:)), for: UIControl.Event.valueChanged)
        //ViewにsegmentをsubViewとして追加
        self.view.addSubview(segment)
        
        //身長の入力
        //textfieldの位置とサイズを設定
        HeightTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 200,width:appDelegate.screenWidth!*0.7 ,height:50)
        //アウトラインを表示
        HeightTextfield.borderStyle = .roundedRect
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        HeightTextfield.clearButtonMode = .whileEditing
        //改行ボタンを完了ボタンに変更
        HeightTextfield.returnKeyType = .done
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        HeightTextfield.placeholder = "身長[cm]を入力してください"
        //数値のみの入力を受け付ける
        HeightTextfield.keyboardType = UIKeyboardType.numberPad
        //viewにtextfieldをsubviewとして追加
        self.view.addSubview(HeightTextfield)
        
        //体重の入力
        //textfieldの位置とサイズを設定
        WeightTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 300,width:appDelegate.screenWidth!*0.7 ,height:50)
        //アウトラインを表示
        WeightTextfield.borderStyle = .roundedRect
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        WeightTextfield.clearButtonMode = .whileEditing
        //改行ボタンを完了ボタンに変更
        WeightTextfield.returnKeyType = .done
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        WeightTextfield.placeholder = "体重[kg]を入力してください"
        //数値のみの入力を受け付ける
        WeightTextfield.keyboardType = UIKeyboardType.numberPad
        //viewにtextfieldをsubviewとして追加
        self.view.addSubview(WeightTextfield)
        
        //年齢の入力
        //textfieldの位置とサイズを設定
        AgeTextfield.frame = CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 400,width:appDelegate.screenWidth!*0.7 ,height:50)
        //アウトラインを表示
        AgeTextfield.borderStyle = .roundedRect
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        AgeTextfield.clearButtonMode = .whileEditing
        //改行ボタンを完了ボタンに変更
        AgeTextfield.returnKeyType = .done
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        AgeTextfield.placeholder = "年齢[歳]を入力してください"
        //数値のみの入力を受け付ける
        AgeTextfield.keyboardType = UIKeyboardType.numberPad
        //viewにtextfieldをsubviewとして追加
        self.view.addSubview(AgeTextfield)
        
    
        //目的の入力
        // ピッカーの作成
        picker = UIPickerView(frame: CGRect(x: ((appDelegate.screenWidth!-appDelegate.screenWidth!*0.7)/2),y: 475,width:appDelegate.screenWidth!*0.7 ,height:100))
        // プロトコルの設定
        picker.delegate = self
        picker.dataSource = self
        // はじめに表示する項目を指定
        picker.selectRow(1, inComponent: 0, animated: true)
        // 画面にピッカーを追加
        self.view.addSubview(picker)
        
        //保存ボタン
        let SaveButton = UIButton()
        SaveButton.frame = CGRect(x:((appDelegate.screenWidth!-100)/2),y:600,width:100,height:50)
        SaveButton.setTitle("完了", for: .normal)
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
        height = Double(HeightTextfield.text!)!
        weight = Double(WeightTextfield.text!)!
        age = Int(AgeTextfield.text!)!
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
}
