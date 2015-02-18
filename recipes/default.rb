#
# Cookbook Name:: df_eclipse
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


                                     
execute "tar -xzvf /vagrant/binaries/eclipse-jee-luna-SR1a-linux-gtk-x86_64.tar.gz -C /opt" do
	user "root"
	action :run
	end

cookbook_file "/home/vagrant/Desktop/eclipse.desktop" do  
	mode "0777" 
	action :create_if_missing
end

execute "desktop-file-install eclipse.desktop" do 
	cwd "/home/vagrant/Desktop"
	action :run 
end

