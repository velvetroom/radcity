import UIKit

final class ViewCollectionFlow:UICollectionViewFlowLayout
{
    override init()
    {
        super.init()
        self.headerReferenceSize = CGSize.zero
        self.footerReferenceSize = CGSize.zero
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsets.zero
        self.scrollDirection = UICollectionViewScrollDirection.vertical
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds:CGRect) -> Bool
    {
        return false
    }
}
