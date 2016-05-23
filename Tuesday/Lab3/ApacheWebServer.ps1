Configuration ApacheWebServer
{     
    Import-DscResource -Module nx   
    
    Node localhost {  

        nxPackage Nginx  
        {  
            Ensure          = 'Present'
            Name            = 'apache2'
            PackageManager  = 'apt'
        }
    }
}