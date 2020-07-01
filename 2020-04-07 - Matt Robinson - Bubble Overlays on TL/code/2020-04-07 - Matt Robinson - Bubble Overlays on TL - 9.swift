// Add all the stripes on top and bottom of the middle at the same time.
// Continue adding until we are outside of the bubble's radius since
// this area is clipped anyway.
var index = 1
// This calculation determines if the edge of the stripe (center of the current
// stripe minus half the stripe width) is within the bubble's radius.
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
