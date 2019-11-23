import UIKit
import FloatingPanel

class ViewController: UIViewController, FloatingPanelControllerDelegate {
    
    // セミモーダルビューの変数
    var floatingPanelController: FloatingPanelController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        button.setTitle("セミモーダルビュー表示", for: .normal)
        button.sizeToFit()
        button.center = self.view.center
        self.view.addSubview(button)
        
        // セミモーダルビューの初期化
        floatingPanelController = FloatingPanelController()
        // 角を丸くする
        floatingPanelController.surfaceView.cornerRadius = 24.0
        // 「floatingPanelDidEndDragging」などが呼ばれるようにDelegateの設定
        floatingPanelController.delegate = self
        
        // セミモーダルビューとなるViewControllerをインスタンス化し、floatingPanelControllerに設定する
        let semiModalViewController = SemiModalViewController()
        floatingPanelController.set(contentViewController: semiModalViewController)
    }
    
    /// 「表示」ボタン押下時処理
    /// - Parameter sender: sender description
    @objc func btnAction(_ sender: Any) {
        // セミモーダルビューを表示する
        floatingPanelController.addPanel(toParent: self, belowView: nil, animated: true)
    }
    
    
    /// セミモーダルビューの移動後に実行される処理（各種サイズに応じて処理を追加する
    /// - Parameters:
    ///   - vc: vc description
    ///   - velocity: velocity description
    ///   - targetPosition: targetPosition description
    func floatingPanelDidEndDragging(_ vc: FloatingPanelController, withVelocity velocity: CGPoint, targetPosition: FloatingPanelPosition) {
        // セミモーダルビューの各表示パターンの高さに応じて処理を実行する
        switch targetPosition {
            case .tip:
                print("tip")
                // tipだった場合には、セミモーダルビューを閉じる
                floatingPanelController.removePanelFromParent(animated: true)
            case .half:
                print("half")
            case .full:
                print("full")
            case .hidden:
                print("hidden")
        }
    }
    
    /// セミモーダルビューのカスタムクラスの適応
    /// - Parameters:
    ///   - vc: vc description
    ///   - newCollection: newCollection description
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return CustomFloatingPanelLayout()
    }
}
