//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Kyrylo Bielykov on 17.12.2022.
//

import UIKit

class EmojiArtView: UIView, UIDropInteractionDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        addInteraction(UIDropInteraction(delegate: self))
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSAttributedString.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSAttributedString.self) {
            providers in
            let dropPoint = session.location(in: self)
            for attributedString in providers as? [NSAttributedString] ?? [] {
                self.addLable(with: attributedString, centeredAt: dropPoint)
            }
        }
    }
    
    func addLable(with attributedString: NSAttributedString, centeredAt point:CGPoint) {
        let lable = UILabel()
        lable.backgroundColor = .clear
        lable.attributedText = attributedString
        lable.sizeToFit()
        lable.center = point
        addEmojiArtGestureRecognizers(to: lable)
        addSubview(lable)
    }
    
    var backgroundImage: UIImage? {didSet {setNeedsDisplay() }}
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
    
}
