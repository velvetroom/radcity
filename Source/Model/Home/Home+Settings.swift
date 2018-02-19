import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadSettings(completion:@escaping(() -> ()))
    {
        self.database.getSettings
        { [weak self] (settings:Settings?) in
            
            if let settings:Settings = settings
            {
                self?.settingsLoaded(
                    settings:settings,
                    completion:completion)
            }
            else
            {
                self?.createSettings(completion:completion)
            }
        }
    }
    
    private func createSettings(completion:@escaping(() -> ()))
    {
        self.database.createSettings
        { [weak self] (settings:Settings) in
        
            self?.settingsLoaded(
                settings:settings,
                completion:completion)
        }
    }
    
    private func settingsLoaded(
        settings:Settings,
        completion:@escaping(() -> ()))
    {
        self.settings = settings
        
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    //MARK: internal
    
    func loadSettings(completion:@escaping(() -> ()))
    {
        guard
            
            self.settings == nil
        
        else
        {
            completion()
            
            return
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadSettings(completion:completion)
        }
    }
}
