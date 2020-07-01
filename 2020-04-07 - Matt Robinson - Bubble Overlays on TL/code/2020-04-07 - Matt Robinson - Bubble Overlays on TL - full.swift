extension BubbleView {
    /// Draws a set of stripes across the view up from bottom left
    /// to top right at a 45 degree angle. The stripes will be
    /// `stripeWidth` wide and have `stripeWidth` between them.
    func drawStripes(in bubbleBounds: CGRect,
                     stripeColor: UIColor,
                     stripeWidth: CGFloat) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // Current radius of the bubble that the stripes should cover.
        // This allows us to draw/clip less stripes since we avoid
        // drawing outside the bubble.
        let bubbleRadius = bubbleBounds.width / 2.0

        // This should be the maximum the stripes would need to be to span
        // from one along the entire diagonal of the bounds. This is
        // supposed to calculate the hypotenuse of the two triangles that
        // form the rectangle.
        let maxPathLength = sqrt(pow(bubbleBounds.width, 2) + pow(bubbleBounds.height, 2))

        // Clip to bubble bounds since none of the stripes should be
        // drawn outside of the provided bubble bounds.
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: bubbleRadius,
                    startAngle: 0,
                    endAngle: 2 * CGFloat.pi,
                    clockwise: true)
        context.addPath(path)
        context.clip()

        // Translate corner to bottom of rectangle.
        context.translateBy(x: 0, y: bubbleBounds.height)

        // Rotate around corner
        context.rotate(by: CGFloat.pi * -45.0 / 180.0)

        // set line attributes
        context.setLineWidth(stripeWidth)
        context.setStrokeColor(stripeColor.cgColor)

        // Now that we've shifted the canvas around, (0,0) from left to right now
        // goes from bottom-left to top-right of the original rectangle. Stroke
        // the middle stripe first since it has no mirror.
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: maxPathLength, y: 0))
        context.strokePath()

        // Add all the stripes on top and bottom of the middle at the same time.
        // Continue adding until we are outside of the bubble's radius since
        // this area is clipped anyway.
        var index = 1
        while (CGFloat(index) * stripeWidth * 2) - (stripeWidth / 2.0) < bubbleRadius {
            let offset = CGFloat(index) * stripeWidth * 2

            // above the middle
            context.move(to: CGPoint(x: 0, y: offset))
            context.addLine(to: CGPoint(x: maxPathLength, y: offset))
            context.strokePath()

            // below the middle
            context.move(to: CGPoint(x: 0, y: -offset))
            context.addLine(to: CGPoint(x: maxPathLength, y: -offset))
            context.strokePath()

            index += 1
        }
    }

    func drawBubble(in bubbleBounds: CGRect,
                    bubbleColor: UIColor) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.orange.cgColor)
        context.fillEllipse(in: bounds)
    }
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
