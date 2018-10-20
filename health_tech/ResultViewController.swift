import UIKit

class ResultViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        let nextButton8 = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height:50))
        nextButton8.setTitle("button8", for: .normal)
        nextButton8.setTitleColor(UIColor.black, for: .normal)
        nextButton8.tintColor = UIColor.black
        //        self.view.backgroundColor = UIColor.white
        nextButton8.backgroundColor = UIColor.white
        
        nextButton8.addTarget(self, action: #selector(ResultViewController.goNext8(_:)), for: .touchUpInside)
        view.addSubview(nextButton8)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext8(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = MainViewController()
        //        nextvc.view.backgroundColor = UIColor.blue
        self.present(nextvc, animated: true, completion: nil)
    }
}
