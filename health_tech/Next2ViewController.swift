import UIKit

class Next2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        
        let nextButton4 = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height:50))
        nextButton4.setTitle("button4", for: .normal)
        nextButton4.setTitleColor(UIColor.black, for: .normal)
        nextButton4.tintColor = UIColor.black
//        self.view.backgroundColor = UIColor.white
        nextButton4.backgroundColor = UIColor.white
        
        nextButton4.addTarget(self, action: #selector(Next2ViewController.goNext4(_:)), for: .touchUpInside)
        view.addSubview(nextButton4)
        
        let nextButton5 = UIButton(frame: CGRect(x: 100,y: 300,width: 100,height:50))
        nextButton5.setTitle("button5", for: .normal)
        nextButton5.setTitleColor(UIColor.black, for: .normal)
        nextButton5.tintColor = UIColor.black
//        self.view.backgroundColor = UIColor.white
        nextButton5.backgroundColor = UIColor.white
        
        nextButton5.addTarget(self, action: #selector(Next2ViewController.goNext5(_:)), for: .touchUpInside)
        view.addSubview(nextButton5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext4(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = Next1ViewController()
//        nextvc.view.backgroundColor = UIColor.yellow
        self.present(nextvc, animated: true, completion: nil)
    }
    
    @objc func goNext5(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = Next3ViewController()
//        nextvc.view.backgroundColor = UIColor.gray
        self.present(nextvc, animated: true, completion: nil)
    }
}
