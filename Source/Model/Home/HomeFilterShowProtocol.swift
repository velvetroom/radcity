import Foundation

protocol HomeFilterShowProtocol
{
    var configFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) { get }
    var toggleFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) { get }
    
    func filter(items:[CookItem]) -> [CookItem]
}
