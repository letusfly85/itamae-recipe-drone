go_path="/root/go"
drone_path="/root/go/src/github.com/drone/drone"

%w{make gcc}.each do |pkg|
	package pkg do
		action :install
	end
end

execute "mkdir" do
	command <<-EOS
		mkdir -p /root/go
	EOS
end

git "get drone code" do
	repository "https://github.com/drone/drone.git"

	destination drone_path

	action :nothing
end

execute "go get drone" do
	command <<-EOS
		export GOPATH=#{go_path}

		goenv global 1.3
		goenv rehash

		cd #{drone_path}
		git checkout 0.4-database

		. ~/.bashrc

		make deps
		make all
		make install
	EOS
end
