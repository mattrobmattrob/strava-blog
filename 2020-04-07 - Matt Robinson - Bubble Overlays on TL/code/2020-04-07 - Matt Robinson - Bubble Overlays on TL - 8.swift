// Now that we've shifted the canvas around, (0,0) from left to right now
// goes from bottom-left to top-right of the original rectangle. Stroke
// the middle stripe first since it has no mirror.
context.move(to: CGPoint(x: 0, y: 0))
context.addLine(to: CGPoint(x: maxPathLength, y: 0))
context.strokePath()
