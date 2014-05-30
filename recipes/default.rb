#
# Cookbook Name:: df_eclipse
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "libarchive"
include_recipe "df_java::default"

directory "/usr/local/eclipse" do 
	recursive true
	mode "0777"
	action :create 
end

libarchive_file "eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz" do 
	path "/vagrant/binaries/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz"
	extract_to "/opt"
	owner "vagrant"
	group "vagrant" 
	action :extract 
end 

file "eclipse.desktop" do 
	cwd "/home/vagran/desktop" 
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
