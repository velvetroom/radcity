import Foundation

struct HomeFilterShowFavourites:HomeFilterShowProtocol
{
    let configFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) =
        ControllerHome.configFilterShowFavourites
    let toggleFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) = ControllerHome.filterShowAll
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        var filtered:[CookItem] = []
        
        for item:CookItem in items
        {
            if item.favourite is CookItemFavouriteOn
            {
                filtered.append(item)
            }
        }
        
        return filtered
    }
}
