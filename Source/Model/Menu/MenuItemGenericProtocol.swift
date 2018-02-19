import Foundation

protocol MenuItemGenericProtocol:MenuItemProtocol
{
    associatedtype A where A.C:Controller<A>
}
