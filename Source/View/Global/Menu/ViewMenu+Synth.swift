import UIKit

extension ViewMenu
{
    //MARK: private
    
    private func synthSelect(index:Int)
    {
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        
        let item:MenuItemProtocol = self.modelAtIndex(index:indexPath)
        
        self.collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
        
        self.controller.menuSelected(item:item)
    }
    
    //MARK: internal
    
    func synthSelect(order:Menu.Order)
    {
        let totalItems:Int = self.collectionView.numberOfItems(
            inSection:0)
        
        let index:Int = order.rawValue
        
        guard
        
            totalItems > index
        
        else
        {
            return
        }
        
        self.synthSelect(index:index)
    }
}
