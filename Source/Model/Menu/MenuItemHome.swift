import UIKit

struct MenuItemHome:MenuItemGenericProtocol
{
    typealias A = ArchHome
    
    let order:Menu.Order = Menu.Order.home
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuHome")
}
