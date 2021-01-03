import UIKit

class AnnualEventViewController: UIViewController {

    // 月の数字を表示するラベル
    @IBOutlet var monthLabel: String!
    // 月に対応する画像を表示するためのイメージビュー
    @IBOutlet var monthImageView: UIImageView!
    // 「次へ」のボタン
    @IBOutlet var nextButton: UIButton!
    
    // 変数monthには表示する月の数字が入っている
    var month: Int = 1
    
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
            monthImageView.image = UIImage(named: "febrary")
        } else if month == 3 {
            monthImageView.image = UIImage(named: "march")
        } else if month == 4 {
            monthImageView.image = UIImage(named: "april")
        } else {
            monthLabel.text = "これ以上表示できません"
            monthImageView.image = nil
        }
    }
}
