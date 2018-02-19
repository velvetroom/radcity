import Foundation

final class Menu
{
    var selected:Menu.Order
    let items:[MenuItemProtocol]
    private let itemsMap:[Menu.Order:MenuItemProtocol]
    
    var selectedItem:MenuItemProtocol?
    {
        get
        {
            let selected:MenuItemProtocol? = self.itemsMap[self.selected]
            
            return selected
        }
    }
    
    init()
    {
        self.selected = Menu.Constants.initialSelected
        self.items = Menu.factoryItems()
        self.itemsMap = Menu.factoryItemsMap(items:items)
    }
}
