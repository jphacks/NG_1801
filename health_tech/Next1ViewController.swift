import UIKit

class Next1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        let nextButton3 = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height:50))
        nextButton3.setTitle("button3", for: .normal)
        nextButton3.setTitleColor(UIColor.black, for: .normal)
        nextButton3.tintColor = UIColor.black
//        self.view.backgroundColor = UIColor.white
        nextButton3.backgroundColor = UIColor.white
        
        nextButton3.addTarget(self, action: #selector(Next1ViewController.goNext3(_:)), for: .touchUpInside)
        view.addSubview(nextButton3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext3(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = Next2ViewController()
//        nextvc.view.backgroundColor = UIColor.blue
        self.present(nextvc, animated: true, completion: nil)
    }
}
