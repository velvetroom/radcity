import UIKit

extension ControllerParent
{
    //MARK: private
    
    private func factoryDirection(item:MenuItemProtocol) ->  ControllerTransition.Horizontal
    {
        let order:Menu.Order = item.order
        let current:Menu.Order = self.menu.selected
        let direction:ControllerTransition.Horizontal
        
        if order.rawValue > current.rawValue
        {
            direction = ControllerTransition.Horizontal.right
        }
        else
        {
            direction = ControllerTransition.Horizontal.left
        }
        
        return direction
    }
    
    //MARK: internal
    
    func factorySelectedController() -> UIViewController?
    {
        guard
            
            let item:MenuItemProtocol = self.menu.selectedItem
        
        else
        {
            return nil
        }
        
        let controller:UIViewController = item.controllerType.init()
        
        return controller
    }
    
    func menuSelected(item:MenuItemProtocol)
    {
        let direction:ControllerTransition.Horizontal = self.factoryDirection(item:item)
        self.menu.selected = item.order
        
        guard
            
            let controller:UIViewController = self.factorySelectedController()
        
        else
        {
            return
        }
        
        self.slideTo(
            horizontal:direction,
            controller:controller)
    }
}
