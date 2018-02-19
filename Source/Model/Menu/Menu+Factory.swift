import Foundation

extension Menu
{
    //MARK: private
    
    private class func instanceItems() -> [MenuItemProtocol]
    {
        let itemsListType:[MenuItemProtocol.Type] = self.itemsListType
        var items:[MenuItemProtocol] = []
        
        for itemType:MenuItemProtocol.Type in itemsListType
        {
            let item:MenuItemProtocol = itemType.init()
            items.append(item)
        }
        
        return items
    }
    
    //MARK: internal
    
    class func factoryItems() -> [MenuItemProtocol]
    {
        var items:[MenuItemProtocol] = self.instanceItems()
        
        items.sort
        { (itemA:MenuItemProtocol, itemB:MenuItemProtocol) -> Bool in
            
            return itemA.order.rawValue < itemB.order.rawValue
        }
        
        return items
    }
    
    class func factoryItemsMap(items:[MenuItemProtocol]) -> [Menu.Order:MenuItemProtocol]
    {
        var map:[Menu.Order:MenuItemProtocol] = [:]
        
        for item:MenuItemProtocol in items
        {
            map[item.order] = item
        }
        
        return map
    }
}
