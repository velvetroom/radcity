import UIKit

extension ViewMenu:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    //MARK: internal
    
    func factoryCollection()
    {
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSize.zero
        flow.footerReferenceSize = CGSize.zero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let collectionView:UICollectionView = UICollectionView(
            frame:CGRect.zero,
            collectionViewLayout:flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.clipsToBounds = true
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            ViewMenuCell.self,
            forCellWithReuseIdentifier:
            ViewMenuCell.reusableIdentifier)
        self.collectionView = collectionView
        
        self.addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
        
        self.selectCurrent()
    }
    
    //MARK: collectionViewDelegate
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let countCells:CGFloat = CGFloat(self.controller.menu.items.count)
            let width:CGFloat = collectionView.bounds.width
            let widthPerCell:CGFloat = width / countCells
            let height:CGFloat = collectionView.bounds.height
            
            let cellSize:CGSize = CGSize(
                width:widthPerCell,
                height:height)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = self.controller.menu.items.count
        
        return count
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MenuItemProtocol = self.modelAtIndex(index:indexPath)
        
        let cell:ViewMenuCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            ViewMenuCell.reusableIdentifier,
            for:indexPath) as! ViewMenuCell
        
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        let item:MenuItemProtocol = self.modelAtIndex(index:indexPath)
        let order:Menu.Order = item.order
        
        if order == self.controller.menu.selected
        {
            return false
        }
        
        return true
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MenuItemProtocol = self.modelAtIndex(index:indexPath)
        self.controller.menuSelected(item:item)
        
        let deadline:DispatchTime = DispatchTime.now() + ViewGlobal.Constants.deselectTime
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak collectionView] in
            
            collectionView?.isUserInteractionEnabled = true
        }
    }
}
