extension BubbleView {
    /// Draws a set of stripes across the view up from bottom left
    /// to top right at a 45 degree angle. The stripes will be
    /// `stripeWidth` wide and have `stripeWidth` between them.
    func drawStripes(in bubbleBounds: CGRect,
                     stripeColor: UIColor,
                     stripeWidth: CGFloat) {...}
}

final class BubbleView: UIView {
    override func draw(_ rect: CGRect) {
        drawBubble(in: bounds, bubbleColor: .orange)

        // Arbitrarily size the size as 1/10th the maximum radius.
        let stripeWidth = bounds.width / 2.0 * 0.1

        drawStripes(in: bounds,
                    stripeColor: UIColor.black.withAlphaComponent(0.3),
                    stripeWidth: stripeWidth)
    }
}
