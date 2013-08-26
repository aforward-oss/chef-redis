

template "#{node[:monit][:confd_dir]}/redis.conf" do
  source "monit_process.conf.erb"
  owner "root"
  group "root"
  mode 0700
  variables( 
    :name => "redis", 
    :pidfile => "/var/run/redis_#{node[:redis][:port]}.pid", 
    :start => "/etc/init.d/redis start", 
    :stop => "/etc/init.d/redis stop" 
  )
  notifies :reload, resources(:service => "monit")
  action :create
end
