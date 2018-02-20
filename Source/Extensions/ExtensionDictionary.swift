import Foundation

extension Dictionary
{
    //MARK: private
    
    private func merge(
        keys:[Key],
        dictionary:[Key:Value]) -> Dictionary
    {
        var newDictionary:[Key:Value] = [:]
        
        for key:Key in keys
        {
            if let value:Value = self[key]
            {
                newDictionary[key] = value
            }
            else if let value:Value = dictionary[key]
            {
                newDictionary[key] = value
            }
        }
        
        return newDictionary
    }
    
    //MARK: internal
    
    func merge(other:Dictionary) -> Dictionary
    {
        var keys:[Key] = []
        let dictKeys:[Key] = Array(self.keys)
        let otherKeys:[Key] = Array(other.keys)
        
        keys.append(contentsOf:dictKeys)
        keys.append(contentsOf:otherKeys)
        
        let dictionary:[Key:Value] = self.merge(
            keys:keys,
            dictionary:other)
        
        return dictionary
    }
}
