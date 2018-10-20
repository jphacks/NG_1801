import UIKit

class ChoiceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        var Name = "コールスロー";
        var Cap = 100;
        var Cal = 100;
        var Protein = 100;
        var Lipid = 100;
        var Carbo = 100;
        var Sodium = 100;
        
        //画像の取得表示
        let imageView = SimpleAsyncImageView(frame: CGRect(x: 100, y: 100, width: 40, height: 40));
        imageView.loadImage(urlString: "http://sej.dga.jp/i/dispImage.php?id=81867");
        imageView.frame = CGRect(x: ((self.view.bounds.width-300)/2),y: 100,width:300,height:200)
        self.view.addSubview(imageView);

        let name: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/2),y: 300,width: 200,height:50))
        name.text = Name
        name.font = UIFont.systemFont(ofSize: 20)
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
        
        let sodium: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: 480,width: 200,height:50))
        sodium.text = "ナトリウム:  \(String(Sodium))   mg"
        sodium.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(sodium)
        
        let nextButton1 = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: self.view.bounds.height-100,width: 100,height:50))
        nextButton1.setTitle("○", for: .normal)
        nextButton1.setTitleColor(UIColor.black, for: .normal)
        nextButton1.layer.borderColor = UIColor.black.cgColor
        nextButton1.layer.borderWidth = 3
        nextButton1.tintColor = UIColor.black
        nextButton1.backgroundColor = UIColor.white
        nextButton1.addTarget(self, action: #selector(ChoiceViewController.goNext1(_:)), for: .touchUpInside)
        view.addSubview(nextButton1)
        
        let nextButton2 = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4*3),y: self.view.bounds.height-100,width: 100,height:50))
        nextButton2.setTitle("×", for: .normal)
        nextButton2.setTitleColor(UIColor.black, for: .normal)
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
        let nextvc = ResultViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
    @objc func goNext2(_ sender: UIButton) {
        let nextvc = ResultViewController()
        self.present(nextvc, animated: true, completion: nil)
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
