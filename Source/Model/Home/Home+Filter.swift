import Foundation

extension Home
{
    //MARK: internal
    
    func filterItems(completion:@escaping(() -> ()))
    {
        var items:[CookItem] = Array(self.recipesMap.values)
        items = self.filter.show.filter(items:items)
        items = self.filter.order.filter(items:items)
        items = self.filter.keyword.filter(items:items)
        
        self.items = items
        self.loadCompleted(completion:completion)
    }
    
    func updateFilterState(filterStateType:HomeFilterStateProtocol.Type)
    {
        self.filterState = filterStateType.init()
    }
    
    func updateFilters(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.filterItems(completion:completion)
        }
    }
}
