import UIKit

class AnnualEventViewController: UIViewController {

    // 月の数字を表示するラベル
    @IBOutlet var monthLabel: String!
    // 月に対応する画像を表示するためのイメージビュー
    @IBOutlet var monthImageView: UIImageView!
    // 「次へ」のボタン
    @IBOutlet var nextButton: UIButton!
    
    // 変数monthには表示する月の数字が入っている
    var month: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 下の3行...次へボタンの角を丸くして、枠線をつけている
        nextButton.layer.cornerRadius = 8
        nextButton.layer.borderWidth = 2
        nextButton.layer.borderColor = nextButton.tintColor.cgColor
        // ここまでがボタンの装飾
    }

    // 「次へ」ボタンを押したときに呼ばれるメソッド
    @IBAction func next() {
        month += 1
        if month == 1 {
            monthLabel.text = "1月"
            monthImageView.image = UIImage(named: "january")
        } else if month == 2 {
            monthLabel.text = "2月"
            monthImageView.image = UIImage(named: "febrary")
        } else if month == 3 {
            monthLabel.text = "3月"
            monthImageView.image = UIImage(named: "march")
        } else if month == 4 {
            monthLabel.text = "4月"
            monthImageView.image = UIImage(named: "april")
        }
        // 背景のアニメーションの実装をしたメソッドを呼び出す
        performNextAnimation()
    }

    //MARK: ここより下はボタンを押すときに起こる背景のアニメーションのコード
    @IBOutlet var backgroundViewHeight: NSLayoutConstraint! {
        didSet {
            backgroundViewHeight.constant = UIScreen.main.bounds.height
        }
    }
    @IBOutlet var backgroundViewWidth: NSLayoutConstraint! {
        didSet {
            backgroundViewWidth.constant = UIScreen.main.bounds.width
        }
    }
    @IBOutlet var backgroundView: UIView!
    
    func performNextAnimation() {
        let width = backgroundViewWidth.constant
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseIn) {
            if width == 0 {
                self.backgroundViewWidth.constant = UIScreen.main.bounds.width
                self.backgroundViewHeight.constant = UIScreen.main.bounds.height
                self.backgroundView.layer.cornerRadius = 0
            } else {
                self.backgroundViewWidth.constant = 0
                self.backgroundViewHeight.constant = 0
                self.backgroundView.layer.cornerRadius = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 2
            }
            self.backgroundView.backgroundColor = [UIColor.systemBlue, UIColor.systemPink, UIColor.systemTeal, UIColor.systemIndigo, UIColor.secondarySystemBackground].randomElement()!
            self.view.layoutIfNeeded()
        }
    }
}
