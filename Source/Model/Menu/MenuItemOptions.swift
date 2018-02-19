import UIKit

struct MenuItemOptions:MenuItemGenericProtocol
{
    typealias A = ArchOptions
    let order:Menu.Order = Menu.Order.options
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuOptions")
}
