import Foundation

extension Data
{
    //MARK: internal
    
    func writeToTemporal(withExtension:String?) -> URL?
    {
        var randomName:String = UUID().uuidString
        
        if let withExtension:String = withExtension
        {
            randomName.append(".")
            randomName.append(withExtension)
        }
        
        let directoryUrl:URL = URL(fileURLWithPath:NSTemporaryDirectory())
        let fileUrl:URL = directoryUrl.appendingPathComponent(randomName)
        
        do
        {
            try self.write(
                to:fileUrl,
                options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            return nil
        }
        
        return fileUrl
    }
    
    mutating func append<T>(value:T)
    {
        var value:T = value
        
        let buffer:UnsafeBufferPointer = UnsafeBufferPointer(
            start:&value,
            count:1)
        
        self.append(buffer)
    }
    
    func arrayFromBytes<T>(elements:Int) -> [T]?
    {   
        let valueSize:Int = MemoryLayout<T>.size
        let expectedSize:Int = elements * valueSize
        
        guard
            
            self.count >= expectedSize
        
        else
        {
            return nil
        }
        
        let array:[T] = withUnsafeBytes
        { (pointer:UnsafePointer<T>) -> [T] in
            
            let bufferPointer:UnsafeBufferPointer = UnsafeBufferPointer(
                start:pointer,
                count:elements)
            
            let array:[T] = Array(bufferPointer)
            
            return array
        }
        
        return array
    }
    
    func valueFromBytes<T>() -> T?
    {
        guard
        
            let array:[T] = self.arrayFromBytes(elements:1),
            let value:T = array.first
        
        else
        {
            return nil
        }
        
        return value
    }
    
    func subdata(
        start:Int,
        endNotIncluding:Int) -> Data
    {
        let range:Range<Data.Index> = Range<Data.Index>(start ..< endNotIncluding)
        let sliced:Data = self.subdata(in:range)
        
        return sliced
    }
    
    func subdata(start:Int) -> Data
    {
        let sliced:Data = self.subdata(
            start:start,
            endNotIncluding:self.count)
        
        return sliced
    }
    
    func subdata(endNotIncluding:Int) -> Data
    {
        let sliced:Data = self.subdata(
            start:0,
            endNotIncluding:endNotIncluding)
        
        return sliced
    }
}
