import Foundation

struct HomeFilterKeyword
{
    var keyword:String
    
    init()
    {
        self.keyword = String()
    }
    
    //MARK: private
    
    private func validateItem(item:CookItem) -> Bool
    {
        guard
        
            self.keyword.isEmpty == false
        
        else
        {
            return true
        }
        
        let itemTitle:String = item.recipe.title.lowercased()
        let containsKeyword:Bool = itemTitle.contains(self.keyword)
        
        return containsKeyword
    }
    
    //MARK: internal
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        var filtered:[CookItem] = []
        
        for item:CookItem in items
        {
            guard
            
                self.validateItem(item:item) == true
            
            else
            {
                continue
            }
            
            filtered.append(item)
        }

        return filtered
    }
}
