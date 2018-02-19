import Foundation

struct HomeFilterShowAll:HomeFilterShowProtocol
{
    let configFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) = ControllerHome.configFilterShowAll
    let toggleFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) = ControllerHome.filterShowFavourites
    
    //MARK: internal
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        return items
    }
}
