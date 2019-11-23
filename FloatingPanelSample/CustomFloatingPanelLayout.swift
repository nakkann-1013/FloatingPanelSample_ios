import UIKit
import FloatingPanel

class CustomFloatingPanelLayout: FloatingPanelLayout {
    
    // ここで、最初に表示するパネルの高さを設定する
    var initialPosition: FloatingPanelPosition {
        return .half
    }

    /// セミモーダルビューの高さを設定する処理
    /// - Parameter position: position description
    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
            case .full:
                return 56.0
            case .half:
                return 262.0
            case .tip:
                return 100.0
            case .hidden:
                return 0
        }
    }

    /// セミモーダルビュー表示中の背景の透明度（0だと通常表示で、1だと真っ暗）
    /// - Parameter position: position description
    func backdropAlphaFor(position: FloatingPanelPosition) -> CGFloat {
        return 0.0
    }
}
