import UIKit

class ConditionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        
        let nextButton6 = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height:50))
        nextButton6.setTitle("button6", for: .normal)
        nextButton6.setTitleColor(UIColor.black, for: .normal)
        nextButton6.tintColor = UIColor.black
//        self.view.backgroundColor = UIColor.white
        nextButton6.backgroundColor = UIColor.white
        
        nextButton6.addTarget(self, action: #selector(ConditionViewController.goNext6(_:)), for: .touchUpInside)
        view.addSubview(nextButton6)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext6(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = ChoiceViewController()
//        nextvc.view.backgroundColor = UIColor.blue
        self.present(nextvc, animated: true, completion: nil)
    }
}
