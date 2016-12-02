import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 300)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

let colors: [UIColor] = [.green, .gray, .purple, .yellow, .red, .orange, .lightGray, .white, .blue]

/*:
 **Task**: Create an even grid on the `canvas`, made out of squares that each are one third as wide and one third as high as the `canvas`.Use the same colors as in the picture (they are already defined for you above in the `colors` array):
 
 ![Challenge 4](./challenge4.png "Challenge 4")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
//Setting Size and Position Variables
let canvasWidth = canvas.frame.size.width
let canvasHeight = canvas.frame.size.height
let squareWidth = Int(canvasWidth / 3)
let squareHeight = Int(canvasHeight / 3)
var positionArray = [0, squareWidth, squareWidth * 2]

//Constructing Frames
let tlFrame = CGRect(x: positionArray[0], y: positionArray[0], width: squareWidth, height: squareHeight)
let tmFrame = CGRect(x: positionArray[1], y: positionArray[0], width: squareWidth, height: squareHeight)
let trFrame = CGRect(x: positionArray[2], y: positionArray[0], width: squareWidth, height: squareHeight)
let mlFrame = CGRect(x: positionArray[0], y: positionArray[1], width: squareWidth, height: squareHeight)
let mmFrame = CGRect(x: positionArray[1], y: positionArray[1], width: squareWidth, height: squareHeight)
let mrFrame = CGRect(x: positionArray[2], y: positionArray[1], width: squareWidth, height: squareHeight)
let blFrame = CGRect(x: positionArray[0], y: positionArray[2], width: squareWidth, height: squareHeight)
let bmFrame = CGRect(x: positionArray[1], y: positionArray[2], width: squareWidth, height: squareHeight)
let brFrame = CGRect(x: positionArray[2], y: positionArray[2], width: squareWidth, height: squareHeight)

//Constructing Views from Frames
let tlView = UIView(frame: tlFrame)
let tmView = UIView(frame: tmFrame)
let trView = UIView(frame: trFrame)
let mlView = UIView(frame: mlFrame)
let mmView = UIView(frame: mmFrame)
let mrView = UIView(frame: mrFrame)
let blView = UIView(frame: blFrame)
let bmView = UIView(frame: bmFrame)
let brView = UIView(frame: brFrame)

//Array of Views
let squareArray = [tlView, tmView, trView, mlView, mmView, mrView, blView, bmView, brView]

//Loop through array of views to set background colors and append to canvas.
for (index, square) in squareArray.enumerated() {
    square.backgroundColor = colors[index]
    canvas.addSubview(square)
}

