import UIKit

class ConditionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let nextButton = UIButton(frame: CGRect(x: ((self.view.bounds.width-100)/2),y: self.view.bounds.height-100,width: 100,height:50))
        nextButton.setTitle("決定", for: .normal)
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.tintColor = UIColor.black
        nextButton.backgroundColor = UIColor.white
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.borderWidth = 3
        nextButton.addTarget(self, action: #selector(ConditionViewController.goNext(_:)), for: .touchUpInside)
        
        view.addSubview(nextButton)
        
        let hoge: UILabel = UILabel(frame: CGRect(x: ((self.view.bounds.width-300)/2),y: 200,width: 300,height:50))
        hoge.text = "下記の項目を選択してください"
        hoge.layer.position = CGPoint(x: 200, y: 50)
        hoge.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(hoge)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func goNext(_ sender: UIButton) {// selectorで呼び出す場合Swift4からは「@objc」をつける。
        let nextvc = ChoiceViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
}
