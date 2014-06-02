#
# Cookbook Name:: df_eclipse
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#



execute "tar -xzvf /vagrant/binaries/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz -C /opt" do
	user "root"
	action :run
	end

file "/home/vagrant/Desktop/eclipse.desktop" do  
	mode "0777" 
	content "[Desktop Entry]\nName=Eclipse\nType=Application\nExec=/opt/eclipse/eclipse\nTerminal=false\nIcon=/opt/eclipse/icon.xmp\nComment=Integrated Development Environment\nNoDisplay=false\nCategories=Development;IDE;\nName[en]=Eclipse"
action :create
end

execute "desktop-file-install eclipse.desktop" do 
	cwd "/home/vagrant/Desktop"
	action :run 
end

