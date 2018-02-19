import Foundation

final class Home:Model<ArchHome>
{
    var settings:Settings?
    var items:[CookItem]
    var recipesMap:[String:CookItem]
    var filter:HomeFilter
    var filterState:HomeFilterStateProtocol
    let database:Database
    let cloud:Cloud
    let storage:Storage
    let filterOptions:[HomeFilterOptionsProtocol]
    
    required init()
    {
        self.database = Database()
        self.cloud = Cloud()
        self.storage = Storage()
        self.items = []
        self.recipesMap = [:]
        self.filter = Home.factoryFilter()
        self.filterOptions = Home.factoryFilterOptions()
        self.filterState = HomeFilterStateHidden()
        
        super.init()
    }
}
