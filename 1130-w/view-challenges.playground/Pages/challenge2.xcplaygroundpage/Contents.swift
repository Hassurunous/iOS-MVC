
import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 300)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

/*:
 **Task**: Add three `UIView`s to the `canvas`. Each of these views should be square and have a third of the `canvas`' `width` and `height`. 
 
 
 ![Challenge 2](./challenge2.png "Challenge 2")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
let redHeight = canvas.frame.height / 3
let redWidth = canvas.frame.width / 3
let redFrame = CGRect(x: 0, y: 0, width: redWidth, height: redHeight)
let redViewCenter = UIView(frame: redFrame)
redViewCenter.center.x = canvas.center.x
redViewCenter.center.y = canvas.center.y
redViewCenter.backgroundColor = .red
let redViewLawfulGood = UIView(frame: redFrame)
redViewLawfulGood.center.x = redFrame.width / 2
redViewLawfulGood.center.y = redFrame.width / 2
redViewLawfulGood.backgroundColor = .red
let redViewChaoticEvil = UIView(frame: redFrame)
redViewChaoticEvil.center.x = (canvas.frame.size.width - (redFrame.width / 2))
redViewChaoticEvil.center.y = (canvas.frame.size.height - (redFrame.height / 2))
redViewChaoticEvil.backgroundColor = .red

canvas.addSubview(redViewCenter)
canvas.addSubview(redViewLawfulGood)
canvas.addSubview(redViewChaoticEvil)
