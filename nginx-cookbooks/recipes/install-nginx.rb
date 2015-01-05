Chef::Log.info("NGINX: Adding mainline Repo")

execute "add-apt-repository ppa:nginx/stable" do
  user "root"
end
execute "apt-get update " do
  user "root"
end
execute "apt-get install nginx" do
  user "root"
end