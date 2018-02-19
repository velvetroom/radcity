import UIKit

class ViewCollection<A, Cell:ViewCollectionCell, Flow:UICollectionViewFlowLayout>:
    View<A>,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
    where A.C:Controller<A>
{
    private(set) weak var collectionView:UICollectionView!
    private(set) weak var flow:Flow!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let flow:Flow = Flow()
        
        let collectionView:UICollectionView = UICollectionView(
            frame:CGRect.zero,
            collectionViewLayout:flow)
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
        self.flow = flow
        
        if #available(iOS 11.0, *)
        {
            collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }
        
        self.addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
        
        self.registerCell(cell:Cell.self)
    }
    
    //MARK: internal
    
    final func registerCell(cell:Cell.Type)
    {
        self.collectionView.register(
            cell,
            forCellWithReuseIdentifier:cell.reusableIdentifier)
    }
    
    final func registerFooter(footer:ViewCollectionReusable.Type)
    {
        self.collectionView.register(
            footer,
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter,
            withReuseIdentifier:footer.reusableIdentifier)
    }
    
    final func registerHeader(header:ViewCollectionReusable.Type)
    {
        self.collectionView.register(
            header,
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,
            withReuseIdentifier:header.reusableIdentifier)
    }
    
    final func cellAtIndex<P:ViewCollectionCell>(
        indexPath:IndexPath,
        reusableIdentifier:String = P.reusableIdentifier) -> P
    {
        let cell:P = self.collectionView.dequeueReusableCell(
            withReuseIdentifier:reusableIdentifier,
            for:indexPath) as! P
        
        return cell
    }
    
    final func reusableAtIndex<P:ViewCollectionReusable>(
        kind:String,
        indexPath:IndexPath,
        reusableIdentifier:String = P.reusableIdentifier) -> P
    {
        let reusable:P = self.collectionView.dequeueReusableSupplementaryView(
            ofKind:kind,
            withReuseIdentifier:reusableIdentifier,
            for:indexPath) as! P
        
        return reusable
    }
    
    //MARK: collectionView delegate
    
    func scrollViewWillBeginDragging(_ scrollView:UIScrollView) { }
    
    func scrollViewDidEndDecelerating(_ scrollView:UIScrollView) { }
    
    func scrollViewDidEndDragging(
        _ scrollView:UIScrollView,
        willDecelerate decelerate:Bool) { }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView:UIScrollView) { }
    
    func scrollViewDidScroll(_ scrollView:UIScrollView) { }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        insetForSectionAt section:Int) -> UIEdgeInsets
    {
        return self.flow.sectionInset
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForHeaderInSection section:Int) -> CGSize
    {
        return self.flow.headerReferenceSize
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForFooterInSection section:Int) -> CGSize
    {
        return self.flow.footerReferenceSize
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        return self.flow.itemSize
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        return 0
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let reusable:ViewCollectionReusable = self.reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return reusable
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let cell:Cell = self.cellAtIndex(indexPath:indexPath)
        
        return cell
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return true
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return true
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        self.collectionView.isUserInteractionEnabled = false
        
        let deadline:DispatchTime = DispatchTime.now() + ViewGlobal.Constants.deselectTime
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak collectionView] in
            
            collectionView?.isUserInteractionEnabled = true
            collectionView?.selectItem(
                at:nil,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition())
        }
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        didDeselectItemAt indexPath:IndexPath) { }
    
    func collectionView(
        _ collectionView:UICollectionView,
        moveItemAt sourceIndexPath:IndexPath,
        to destinationIndexPath:IndexPath) { }
}
