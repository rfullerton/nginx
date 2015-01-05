Chef::Log.info("NGINX: Adding mainline Repo")
execute "add-apt-repository ppa:nginx/development" do
user "root"
end
execute "apt-get update " do
user "root"
end
execute "apt-get install nginx -y" do
user "root"
end