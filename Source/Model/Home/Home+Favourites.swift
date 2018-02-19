import Foundation

extension Home
{
    //MARK: private
    
    private func addFavouritesToRecipes(
        favouritesList:[RecipeFavourite],
        completion:@escaping(() -> ()))
    {
        for recipeFavourite:RecipeFavourite in favouritesList
        {
            guard
            
                let recipeIdentifier:String = recipeFavourite.recipeIdentifier,
                let cookItem:CookItem = self.recipesMap[recipeIdentifier]
                
            else
            {
                continue
            }
            
            let favourite:CookItemFavouriteOn = CookItemFavouriteOn(recipeFavourite:recipeFavourite)
            cookItem.favourite = favourite
        }
        
        self.filterItems(completion:completion)
    }
    
    //MARK: internal
    
    func loadFavourites(completion:@escaping(() -> ()))
    {
        self.database.getFavourites
        { [weak self] (favouritesList:[RecipeFavourite]) in
            
            self?.addFavouritesToRecipes(
                favouritesList:favouritesList,
                completion:completion)
        }
    }
}
