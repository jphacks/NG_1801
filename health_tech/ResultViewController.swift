import UIKit
import RealmSwift

class ResultViewController: UIViewController, UIScrollViewDelegate{
    
    var Cap:Double = 0
    var Cal = 0
    var Protein:Double = 0
    var Lipid:Double = 0
    var Carbo:Double = 0
    var Sodium:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景画像の変更
        self.view.backgroundColor = UIColor.white
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "bg.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.timecalculation(time: appDelegate.time)
        let num = appDelegate.selectedFoods.count
        let scrollHeight = 660+250*num

        let scrollView = UIScrollView()
        // 表示窓のサイズと位置を設定
        scrollView.frame.size = CGSize(width: appDelegate.screenWidth!, height: appDelegate.screenHeight!)
        // 中身の大きさを設定
        scrollView.contentSize = CGSize(width: Int(appDelegate.screenWidth!), height: scrollHeight)
        scrollView.bounces = false
        // スクロールバーの見た目と余白
        scrollView.indicatorStyle = .white
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        scrollView.delegate = self
        
        //タイトルの表示
        let title:UILabel = UILabel(frame: CGRect(x: 0, y: 50, width: Int(appDelegate.screenWidth!), height: 50))
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont.systemFont(ofSize: 32)
        title.text = "この商品を食べよう！"
        scrollView.addSubview(title)
        
        // ScrollViewの中身を作る
        for i in 0 ..< num {
            //商品情報取得
            let str = "id==\(String(appDelegate.selectedFoods[i]))"
            let realm = try! Realm()
            let food:Food = realm.objects(Food.self).filter(str).first!
            //画像の取得表示
            let imageView = SimpleAsyncImageView(frame: CGRect(x: (Int((appDelegate.screenWidth!-200)/2)), y: 100+250*i, width: 200, height: 200))
            imageView.loadImage(urlString: food.url)
            scrollView.addSubview(imageView)
            //商品名の表示
            let name:UILabel = UILabel(frame: CGRect(x: 0, y: 300+250*i, width: Int(appDelegate.screenWidth!), height: 50))
            name.textAlignment = NSTextAlignment.center
            name.text = food.name
            scrollView.addSubview(name)
            //栄養の計算
            Cap = Cap + food.gram
            Cal = Cal + food.cal
            Protein = Protein + food.protein
            Lipid = Lipid + food.lipid
            Carbo = Carbo + food.carbohydrate
            Sodium = Sodium + food.sodium
        }
        
        //栄養の表示
        let total:UILabel = UILabel(frame: CGRect(x: 0, y: 100+250*num, width: Int(appDelegate.screenWidth!), height: 50))
        total.textAlignment = NSTextAlignment.center
        total.font = UIFont.systemFont(ofSize: 32)
        total.text = "合計栄養素(標準値)"
        scrollView.addSubview(total)
        
        let capacity: UILabel = UILabel(frame: CGRect(x: 40,y: 100+250*num+60,width: Int(appDelegate.screenWidth!),height:50))
        capacity.textAlignment = NSTextAlignment.left
        capacity.text = "内容量:  \(String(round(Cap*10)/10))  g"
        capacity.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(capacity)
        
        let calorie: UILabel = UILabel(frame: CGRect(x: 40,y: 100+250*num+120,width: Int(appDelegate.screenWidth!),height:50))
        calorie.textAlignment = NSTextAlignment.left
        calorie.text = "カロリー:      \(String(round(Double(Cal*10))/10))  kcal (\(String(round(appDelegate.recal*10)/10))kcal)"
        calorie.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(calorie)
        
        let protein: UILabel = UILabel(frame: CGRect(x: 40,y: 100+250*num+180,width: Int(appDelegate.screenWidth!),height:50))
        protein.textAlignment = NSTextAlignment.left
        protein.text = "タンパク質:  \(String(round(Protein*10)/10))  g (\(String(round(appDelegate.reprotein*10)/10))g)"
        protein.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(protein)
        
        let lipid: UILabel = UILabel(frame: CGRect(x: 40,y: 100+250*num+240,width: Int(appDelegate.screenWidth!),height:50))
        lipid.textAlignment = NSTextAlignment.left
        lipid.text = "脂質:               \(String(round(Lipid*10)/10))  g (\(String(round(appDelegate.relipid*10)/10))g)"
        lipid.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(lipid)
        
        let carbo: UILabel = UILabel(frame: CGRect(x: 40,y: 100+250*num+300,width: Int(appDelegate.screenWidth!),height:50))
        carbo.textAlignment = NSTextAlignment.left
        carbo.text = "炭水化物:      \(String(round(Carbo*10)/10))  g (\(String(round(appDelegate.recarbo*10)/10))g)"
        carbo.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(carbo)
        
        let sodium: UILabel = UILabel(frame: CGRect(x:40,y: 100+250*num+360,width: Int(appDelegate.screenWidth!),height:50))
        sodium.textAlignment = NSTextAlignment.left
        sodium.text = "ナトリウム:  \(String(round(Sodium*10)/10/1000))  g (\(String(round(appDelegate.resodium*10)/10))g)"
        sodium.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(sodium)
        
        let nextButton = UIButton()
        nextButton.frame = CGRect(x:(Int((appDelegate.screenWidth!-200)/2)),y: 560+250*num,width:200,height:50)
        nextButton.setTitle("メイン画面へ", for: .normal)
        nextButton.layer.borderColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        nextButton.setTitleColor(UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), for: .normal)
        nextButton.layer.borderWidth = 1
        nextButton.layer.cornerRadius = 10.0
        nextButton.backgroundColor = UIColor.white
        nextButton.addTarget(self, action: #selector(goToMain(_:)), for: .touchUpInside)
        scrollView.addSubview(nextButton)
        self.view.addSubview(scrollView)
        
        let statusBar = UIView(frame:CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0))
        statusBar.backgroundColor = UIColor.white
        
        view.addSubview(statusBar)
        
        //選択した商品をリセット
        appDelegate.selectedFoods.removeAll()
        appDelegate.rejectedFoods.removeAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //メインページに遷移
    @objc func goToMain(_ sender: UIButton) {
        self.present(MainViewController(), animated: false, completion: nil)
    }
}
