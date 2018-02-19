import Foundation

protocol HomeFilterOrderProtocol
{
    var configFilter:((ControllerHome) -> (ViewHomeFilterListCellOrder) -> ()) { get }
    
    func filter(items:[CookItem]) -> [CookItem]
}
