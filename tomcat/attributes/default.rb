



if node['platform'] == "ubuntu"
    default['package_name'] = "tomcat7"
else
    default['package_name'] = "tomcat"    
end