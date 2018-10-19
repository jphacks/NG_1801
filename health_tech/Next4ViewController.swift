import UIKit

class Next4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        
        let nextButton7 = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height:50))
        nextButton7.setTitle("button7", for: .normal)
        nextButton7.setTitleColor(UIColor.black, for: .normal)
        nextButton7.tintColor = UIColor.black
//        self.view.backgroundColor = UIColor.white
        nextButton7.backgroundColor = UIColor.white
        
        nextButton7.addTarget(self, action: #selector(Next4ViewController.goNext7(_:)), for: .touchUpInside)
        view.addSubview(nextButton7)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext7(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = Next5ViewController()
//        nextvc.view.backgroundColor = UIColor.blue
        self.present(nextvc, animated: true, completion: nil)
    }
}
