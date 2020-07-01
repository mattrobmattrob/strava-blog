extension BubbleView {
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

        ...
    }
}
