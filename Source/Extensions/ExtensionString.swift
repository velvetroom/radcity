import Foundation

extension String
{
    static func localizedController(key:String) -> String
    {
        return NSLocalizedString(
            key,
            tableName:String.Constants.tableController,
            comment:String())
    }
    
    static func localizedModel(key:String) -> String
    {
        return NSLocalizedString(
            key,
            tableName:String.Constants.tableModel,
            comment:String())
    }
    
    static func localizedView(key:String) -> String
    {
        return NSLocalizedString(
            key,
            tableName:String.Constants.tableView,
            comment:String())
    }
    
    static func localizedError(key:String) -> String
    {
        return NSLocalizedString(
            key,
            tableName:String.Constants.tableError,
            comment:String())
    }
    
    func appendingPathComponent(component:String) -> String
    {
        var newString:String = self
        newString.append("/")
        newString.append(component)
        
        return newString
    }
}
