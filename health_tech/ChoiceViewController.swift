import UIKit
import RealmSwift

class ChoiceViewController: UIViewController {
    
    //AppDelegateのインスタンスを取得
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var food:Food = Food()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subviews = self.view.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        //背景画像の変更
        self.view.backgroundColor = UIColor.white
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "bg.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        let foods = appDelegate.recommendFoods
        food = foods[appDelegate.foodId]

        
        var Name = food.name
        var Cap = food.gram
        var Cal = food.cal
        var Protein = food.protein
        var Lipid = food.lipid
        var Carbo = food.carbohydrate
        var Sodium = food.sodium
        var Url = food.url
        //画像の取得表示
        let imageView = SimpleAsyncImageView(frame: CGRect(x: ((self.view.bounds.width-200)/2), y: 100, width: 200, height: 200));
        imageView.loadImage(urlString: Url);
        self.view.addSubview(imageView);
        //商品名
        let name: UILabel = UILabel(frame: CGRect(x: 0,y: 300,width: self.view.bounds.width,height:50))
        name.text = Name
        name.font = UIFont.systemFont(ofSize: 20)
        name.textAlignment = NSTextAlignment.center
        self.view.addSubview(name)
        //内容量
        let capacity: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 330,width: 200,height:50))
        capacity.text = "内容量:          \(String(Cap))  g"
        capacity.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(capacity)
        //カロリー
        let calorie: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 360,width: 200,height:50))
        calorie.text = "カロリー:      \(String(Cal))  kcal"
        calorie.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(calorie)
        //タンパク質
        let protein: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 390,width: 200,height:50))
        protein.text = "タンパク質:  \(String(Protein))  g"
        protein.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(protein)
        //脂質
        let lipid: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 420,width: 200,height:50))
        lipid.text = "脂質:               \(String(Lipid))  g"
        lipid.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(lipid)
        //炭水化物
        let carbo: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 450,width: 200,height:50))
        carbo.text = "炭水化物:      \(String(Carbo))  g"
        carbo.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(carbo)
        //ナトリウム
        let sodium: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 480,width: 300,height:50))
        sodium.text = "ナトリウム:  \(String(Sodium))   mg"
        sodium.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(sodium)
        //OKボタン
        let yesButton = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: self.view.bounds.height-100,width: 100,height:50))
        yesButton.setTitle("◯", for: .normal)
        yesButton.setTitleColor(UIColor.blue, for: .normal)
        yesButton.layer.borderColor = UIColor.black.cgColor
        yesButton.layer.borderWidth = 1
        yesButton.tintColor = UIColor.black
        yesButton.backgroundColor = UIColor.white
        yesButton.layer.cornerRadius = 10.0
        yesButton.addTarget(self, action: #selector(ChoiceViewController.yes(_:)), for: .touchUpInside)
        view.addSubview(yesButton)
        //NOボタン
        let noButton = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4*3),y: self.view.bounds.height-100,width: 100,height:50))
        noButton.setTitle("×", for: .normal)
        noButton.setTitleColor(UIColor.red, for: .normal)
        noButton.layer.borderColor = UIColor.black.cgColor
        noButton.layer.borderWidth = 1
        noButton.tintColor = UIColor.black
        noButton.layer.cornerRadius = 10.0
        noButton.backgroundColor = UIColor.white
        noButton.addTarget(self, action: #selector(ChoiceViewController.no(_:)), for: .touchUpInside)
        view.addSubview(noButton)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func yes(_ sender: UIButton) {
        appDelegate.foodId = Int(arc4random(lower: 10, upper: 30))
        appDelegate.selectedFoods.append(food.id)
        appDelegate.rejectedFoods.append(food.id)
        appDelegate.recalculation(food: food)
        if appDelegate.recommend == false {
            appDelegate.sort()
            viewDidLoad()
        }else{
            appDelegate.recommend = false
            let nextvc = ResultViewController()
            self.present(nextvc, animated: true, completion: nil)
        }
    }
    @objc func no(_ sender: UIButton) {
        appDelegate.rejectedFoods.append(food.id)
        appDelegate.foodId += 1
        viewDidLoad()
    }
    //範囲指定のランダム関数
    func arc4random(lower: UInt32, upper: UInt32) -> UInt32 {
        guard upper >= lower else {
            return 0
        }
        return arc4random_uniform(upper - lower) + lower
    }
}

class SimpleAsyncImageView: UIImageView {
    let CACHE_SEC : TimeInterval = 5 * 60; //5分キャッシュ
    
    //画像を非同期で読み込む
    func loadImage(urlString: String){
        let req = URLRequest(url: NSURL(string:urlString)! as URL,
                             cachePolicy: .returnCacheDataElseLoad,
                             timeoutInterval: CACHE_SEC);
        let conf =  URLSessionConfiguration.default;
        let session = URLSession(configuration: conf, delegate: nil, delegateQueue: OperationQueue.main);
        
        session.dataTask(with: req, completionHandler:
            { (data, resp, err) in
                if((err) == nil){ //Success
                    let image = UIImage(data:data!)
                    self.image = image;
                    
                }else{ //Error
                    print("AsyncImageView:Error \(String(describing: err?.localizedDescription))");
                }
        }).resume();
    }
    
    
}
