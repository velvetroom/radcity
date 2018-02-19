import UIKit

extension ViewMenu
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MenuItemProtocol
    {
        let item:MenuItemProtocol = self.controller.menu.items[index.item]
        
        return item
    }
    
    func selectCurrent()
    {
        let indexSelected:Int = self.controller.menu.selected.rawValue
        
        let indexPath:IndexPath = IndexPath(
            item:indexSelected,
            section:0)
        
        self.collectionView.selectItem(
            at:indexPath,
            animated:false,
            scrollPosition:UICollectionViewScrollPosition())
    }
}
