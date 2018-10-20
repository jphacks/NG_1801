import UIKit
import RealmSwift

class ChoiceViewController: UIViewController {
    
    var jadgement = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let subviews = self.view.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        //AppDelegateのインスタンスを取得
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

            let realm = try! Realm()
            let foods = realm.objects(Food.self).filter("cal < 1000")
            let food:Food = foods[appDelegate.foodId]
//        let food:Food = foods[76]
        
            var Name = food.name
            var Cap = food.gram
            var Cal = food.cal
            var Protein = food.protein
            var Lipid = food.lipid
            var Carbo = food.carbohydrate
            var Sodium = food.sodium
            var Url = food.url
        print(Url)
        
            //画像の取得表示
            let imageView = SimpleAsyncImageView(frame: CGRect(x: ((self.view.bounds.width-200)/2), y: 100, width: 200, height: 200));
            imageView.loadImage(urlString: Url);
            self.view.addSubview(imageView);

            let name: UILabel = UILabel(frame: CGRect(x: 0,y: 300,width: self.view.bounds.width,height:50))
            name.text = Name
            name.font = UIFont.systemFont(ofSize: 20)
            name.textAlignment = NSTextAlignment.center
            self.view.addSubview(name)

            let capacity: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 330,width: 200,height:50))
            capacity.text = "内容量:          \(String(Cap))  g"
            capacity.font = UIFont.systemFont(ofSize: 20)
            self.view.addSubview(capacity)
            
            let calorie: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 360,width: 200,height:50))
            calorie.text = "カロリー:      \(String(Cal))  kcal"
            calorie.font = UIFont.systemFont(ofSize: 20)
            self.view.addSubview(calorie)
            
            let protein: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 390,width: 200,height:50))
            protein.text = "タンパク質:  \(String(Protein))  g"
            protein.font = UIFont.systemFont(ofSize: 20)
            self.view.addSubview(protein)
            
            let lipid: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 420,width: 200,height:50))
            lipid.text = "脂質:               \(String(Lipid))  g"
            lipid.font = UIFont.systemFont(ofSize: 20)
            self.view.addSubview(lipid)
            
            let carbo: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 450,width: 200,height:50))
            carbo.text = "炭水化物:      \(String(Carbo))  g"
            carbo.font = UIFont.systemFont(ofSize: 20)
            self.view.addSubview(carbo)
            
            let sodium: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 480,width: 300,height:50))
            sodium.text = "ナトリウム:  \(String(Sodium))   mg"
            sodium.font = UIFont.systemFont(ofSize: 20)
            self.view.addSubview(sodium)
            
            let nextButton1 = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: self.view.bounds.height-100,width: 100,height:50))
            nextButton1.setTitle("○", for: .normal)
            nextButton1.setTitleColor(UIColor.blue, for: .normal)
            nextButton1.layer.borderColor = UIColor.black.cgColor
            nextButton1.layer.borderWidth = 3
            nextButton1.tintColor = UIColor.black
            nextButton1.backgroundColor = UIColor.white
            nextButton1.addTarget(self, action: #selector(ChoiceViewController.goNext1(_:)), for: .touchUpInside)
            view.addSubview(nextButton1)
            
            let nextButton2 = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4*3),y: self.view.bounds.height-100,width: 100,height:50))
            nextButton2.setTitle("×", for: .normal)
            nextButton2.setTitleColor(UIColor.red, for: .normal)
            nextButton2.layer.borderColor = UIColor.black.cgColor
            nextButton2.layer.borderWidth = 3
            nextButton2.tintColor = UIColor.black
            nextButton2.backgroundColor = UIColor.white
            nextButton2.addTarget(self, action: #selector(ChoiceViewController.goNext2(_:)), for: .touchUpInside)
            view.addSubview(nextButton2)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext1(_ sender: UIButton) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.foodId += 1
//            viewDidLoad()
//        }
        if jadgement == 1{
            viewDidLoad()
        }else{
        let nextvc = ResultViewController()
        self.present(nextvc, animated: true, completion: nil)
        }
    }
    @objc func goNext2(_ sender: UIButton) {
        viewDidLoad()
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
