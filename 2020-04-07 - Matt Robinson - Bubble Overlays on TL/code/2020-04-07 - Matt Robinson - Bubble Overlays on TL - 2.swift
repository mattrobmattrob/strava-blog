extension BubbleView {
    func drawBubble(in bubbleBounds: CGRect, bubbleColor: UIColor) {
        // 1.
        guard let context = UIGraphicsGetCurrentContext() else { return }
        // 2.
        context.setFillColor(bubbleColor.cgColor)
        // 3.
        context.fillEllipse(in: bounds)
    }
}

final class BubbleView: UIView {
    override func draw(_ rect: CGRect) {
        drawBubble(in: bounds, bubbleColor: .orange)
    }
}
