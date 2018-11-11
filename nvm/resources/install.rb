# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :url, String, default: "https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh"
property :location, String, default: "/home/vagrant/install.sh"
action :install do
    remote_file :location do
        source :url
        mode '0755' 
        action :create
    end
    execute 'install' do
        command "sh #{:location}"
        action :run
        not_if {::Dir.exists?('/root/.nvm')}
        notifies :reboot_now, 'reboot[nvm2]'
    end
    reboot 'nvm' do
        action :nothing
        reason 'configuring nvm requires reboot'
        delay_mins minutes
    end
    reboot 'nvm2' do
        action :nothing
        reason 'configuring nvm requires reboot'
        delay_mins 3
        ignore_failure true
    end
    
    
end

    