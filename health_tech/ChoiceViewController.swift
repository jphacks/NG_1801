import UIKit

class ChoiceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let imageView = SimpleAsyncImageView(frame: CGRect(x: 100, y: 100, width: 40, height: 40));
        imageView.loadImage(urlString: "http://sej.dga.jp/i/dispImage.php?id=81867");
        imageView.frame = CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width:300,height:200)
        self.view.addSubview(imageView);

        let nextButton1 = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4),y: self.view.bounds.height-200,width: 100,height:50))
        
        nextButton1.setTitle("○", for: .normal)
        nextButton1.setTitleColor(UIColor.black, for: .normal)
        nextButton1.layer.borderColor = UIColor.black.cgColor
        nextButton1.layer.borderWidth = 3
        nextButton1.tintColor = UIColor.black
        nextButton1.backgroundColor = UIColor.white
        nextButton1.addTarget(self, action: #selector(ChoiceViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton1)
        
        let nextButton2 = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/4*3),y: self.view.bounds.height-200,width: 100,height:50))
        nextButton2.setTitle("×", for: .normal)
        nextButton2.setTitleColor(UIColor.black, for: .normal)
        nextButton2.layer.borderColor = UIColor.black.cgColor
        nextButton2.layer.borderWidth = 3
        nextButton2.tintColor = UIColor.black
        nextButton2.backgroundColor = UIColor.white
        nextButton2.addTarget(self, action: #selector(ChoiceViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton2)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
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
