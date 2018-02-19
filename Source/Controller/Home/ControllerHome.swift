import UIKit

final class ControllerHome:Controller<ArchHome>, UISearchBarDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.viewMain.superview?.isUserInteractionEnabled = false
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        self.model.loadSettings
        { [weak self] in
            
            self?.loadRecipes()
        }
    }
    
    //MARK: private
    
    private func loadRecipes()
    {
        self.model.loadRecipes
        { [weak self] in
        
            self?.modelReady()
        }
    }
    
    private func modelReady()
    {
        self.viewMain.viewSpinner.stopAnimating()
        self.viewMain.viewList.isHidden = false
        self.viewMain.viewList.collectionView.reloadData()
        self.viewMain.superview?.isUserInteractionEnabled = true
    }
    
    //MARK: internal
    
    func transitionToRecipe(item:CookItem)
    {
        guard
            
            let settings:Settings = self.model.settings
        
        else
        {
            return
        }
        
        let controller:ControllerCook = ControllerCook(
            item:item,
            settings:settings)
        
        self.parentController?.push(
            controller:controller,
            horizontal:ControllerTransition.Horizontal.right)
    }
    
    //MARK: search bar delegate
    
    func searchBarTextDidBeginEditing(_ searchBar:UISearchBar)
    {
        self.animateShowSearch()
    }
    
    func searchBarCancelButtonClicked(_ searchBar:UISearchBar)
    {
        self.animateHideSearch()
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar:UISearchBar)
    {
        searchBar.resignFirstResponder()
        
        guard
        
            let search:String = searchBar.text,
            search.isEmpty == true
        
        else
        {
            return
        }
        
        self.animateHideSearch()
    }
    
    func searchBar(
        _ searchBar:UISearchBar,
        textDidChange searchText:String)
    {
        self.model.filter.keyword.keyword = searchText.lowercased()
        self.updateFilters()
    }
}
