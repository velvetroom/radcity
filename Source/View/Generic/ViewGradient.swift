import UIKit

final class ViewGradient:UIView
{
    class func diagonal(
        colourLeftBottom:UIColor,
        colourTopRight:UIColor) -> ViewGradient
    {
        let colours:[CGColor] = [
            colourLeftBottom.cgColor,
            colourTopRight.cgColor]
        
        let locations:[NSNumber] = [
            ViewGradient.Constants.locationStart,
            ViewGradient.Constants.locationEnd]
        
        let startPoint:CGPoint = CGPoint(x:0, y:1)
        let endPoint:CGPoint = CGPoint(x:1, y:0)
        
        let gradient:ViewGradient = ViewGradient(
            colours:colours,
            locations:locations,
            startPoint:startPoint,
            endPoint:endPoint)
        
        return gradient
    }
    
    class func horizontal(
        colourLeft:UIColor,
        colourRight:UIColor) -> ViewGradient
    {
        let colours:[CGColor] = [
            colourLeft.cgColor,
            colourRight.cgColor]
        
        let locations:[NSNumber] = [
            ViewGradient.Constants.locationStart,
            ViewGradient.Constants.locationEnd]
        
        let startPoint:CGPoint = CGPoint(x:0, y:0.5)
        let endPoint:CGPoint = CGPoint(x:1, y:0.5)
        
        let gradient:ViewGradient = ViewGradient(
            colours:colours,
            locations:locations,
            startPoint:startPoint,
            endPoint:endPoint)
        
        return gradient
    }
    
    class func vertical(
        colourTop:UIColor,
        colourBottom:UIColor) -> ViewGradient
    {
        let colours:[CGColor] = [
            colourTop.cgColor,
            colourBottom.cgColor]
        
        let locations:[NSNumber] = [
            ViewGradient.Constants.locationStart,
            ViewGradient.Constants.locationEnd]
        
        let startPoint:CGPoint = CGPoint(x:0.5, y:0)
        let endPoint:CGPoint = CGPoint(x:0.5, y:1)
        
        let gradient:ViewGradient = ViewGradient(
            colours:colours,
            locations:locations,
            startPoint:startPoint,
            endPoint:endPoint)
        
        return gradient
    }
    
    private init(
        colours:[CGColor],
        locations:[NSNumber],
        startPoint:CGPoint,
        endPoint:CGPoint)
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
        
        guard
            
            let gradientLayer:CAGradientLayer = self.layer as? CAGradientLayer
            
        else
        {
            return
        }
    
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
        gradientLayer.colors = colours
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override open class var layerClass:AnyClass
    {
        get
        {
            return CAGradientLayer.self
        }
    }
}
