import Foundation

extension FileManager
{
    //MARK: private
    
    private var systemAttributes:[FileAttributeKey:Any]?
    {
        get
        {
            let path:String = self.appDirectory.path
            let attributes:[FileAttributeKey:Any]
            
            do
            {
                try attributes = self.attributesOfFileSystem(forPath:path)
            }
            catch
            {
                return nil
            }
            
            return attributes
        }
    }
    
    private func sizeOfItems(url:URL) -> UInt64
    {
        var size:UInt64 = 0
        let contents:[URL] = self.urlsInDirectory(url:url)
        
        for url:URL in contents
        {
            let itemSize:UInt64 = self.sizeAt(url:url)
            size += itemSize
        }
        
        return size
    }
    
    private func sizeOfItem(url:URL) -> UInt64
    {
        let attributes:[FileAttributeKey:Any]
        
        do
        {
            try attributes = self.attributesOfItem(atPath:url.path)
        }
        catch
        {
            return 0
        }
        
        guard
            
            let sizeNumber:NSNumber = attributes[FileAttributeKey.size] as? NSNumber
            
        else
        {
            return 0
        }
        
        let size:UInt64 = sizeNumber.uint64Value
        
        return size
    }
    
    //MARK: internal
    
    var appDirectory:URL
    {
        get
        {
            let urlsDict:[URL] = urls(
                for:FileManager.SearchPathDirectory.documentDirectory,
                in:FileManager.SearchPathDomainMask.userDomainMask)
            
            let appDirectory:URL = urlsDict.last!
            
            return appDirectory
        }
    }
    
    var systemSize:UInt64
    {
        guard
        
            let objectSystemSize:NSNumber = self.systemAttributes?[FileAttributeKey.systemSize] as? NSNumber
        
        else
        {
            return 0
        }
        
        let systemSize:UInt64 = objectSystemSize.uint64Value
        
        return systemSize
    }
    
    var systemFreeSize:UInt64
    {
        guard
            
            let objectSystemSize:NSNumber = self.systemAttributes?[FileAttributeKey.systemFreeSize] as? NSNumber
            
        else
        {
            return 0
        }
        
        let systemSize:UInt64 = objectSystemSize.uint64Value
        
        return systemSize
    }
    
    func sizeAt(url:URL) -> UInt64
    {
        var isDirectory:ObjCBool = false
        
        guard
            
            self.fileExists(atPath:url.path, isDirectory:&isDirectory)
            
        else
        {
            return 0
        }
        
        var size:UInt64 = self.sizeOfItem(url:url)
        
        guard
            
            isDirectory.boolValue
            
        else
        {
            return size
        }
        
        let itemsSize:UInt64 = self.sizeOfItems(url:url)
        size += itemsSize
        
        return size
    }
    
    func urlsInDirectory(url:URL) -> [URL]
    {
        let contents:[String]
        var urls:[URL] = []
        
        do
        {
            try contents = self.contentsOfDirectory(atPath:url.path)
        }
        catch
        {
            return []
        }
        
        for path:String in contents
        {
            let url:URL = url.appendingPathComponent(path)
            urls.append(url)
        }
        
        return urls
    }
}
