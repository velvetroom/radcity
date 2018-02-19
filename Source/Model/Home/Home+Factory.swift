import Foundation

extension Home
{
    //MARK: private
    
    private class func factoryFilterShow() -> HomeFilterShowProtocol
    {
        let show:HomeFilterShowAll = HomeFilterShowAll()
        
        return show
    }
    
    private class func factoryFilterOrder() -> HomeFilterOrderProtocol
    {
        let order:HomeFilterOrderDate = HomeFilterOrderDate()
        
        return order
    }
    
    //MARK: internal
    
    class func factoryFilter() -> HomeFilter
    {
        let show:HomeFilterShowProtocol = Home.factoryFilterShow()
        let order:HomeFilterOrderProtocol = Home.factoryFilterOrder()
        let keyword:HomeFilterKeyword = HomeFilterKeyword()
        
        let filter:HomeFilter = HomeFilter(
            show:show,
            order:order,
            keyword:keyword)
        
        return filter
    }
    
    class func factoryFilterOptions() -> [HomeFilterOptionsProtocol]
    {
        let optionShow:HomeFilterOptionsShow = HomeFilterOptionsShow()
        let optionOrder:HomeFilterOptionsOrder = HomeFilterOptionsOrder()
        
        let options:[HomeFilterOptionsProtocol] = [
            optionOrder,
            optionShow]
        
        return options
    }
}
