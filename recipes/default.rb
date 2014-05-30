#
# Cookbook Name:: df_eclipse
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "df_java::default"


execute "tar -xzvf /vagrant/binaries/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz -C /opt" do
	user "root"
	action :run
	not_if do FileTest.directory?("/opt/eclipse/eclipse")end
	end

file "eclipse.desktop" do 
	cwd "/home/vagrant/desktop" 
	mode "0777" 
	content "[Desktop Entry]\n
Name=Eclipse\n 
Type=Application\n 
Exec=eclipse\n 
Terminal=false\n 
Icon=eclipse\n 
Comment=Integrated Development Environment\n 
NoDisplay=false\n
Categories=Development;IDE;\n
Name[en]=Eclipse"
action :create
end

execute "desktop-file-install eclipse.desktop" do 
	action :run 
end
 
 link "/usr/local/bin" do 
 	to "/opt/eclipse/eclipse" 
 	link_type :symbolic
 end
