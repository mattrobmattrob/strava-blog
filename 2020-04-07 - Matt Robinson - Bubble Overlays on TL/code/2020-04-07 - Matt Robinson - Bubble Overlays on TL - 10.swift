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
