#
# Virtual Host configuration for rosegold.ga
#

upstream rosegold {
	server rosegold-1:3000;
}

server {
	# protocol and url settings
	listen 443 ssl;
	server_name rosegold.ga m.rosegold.ga www.rosegold.ga;
	
	# ssl settings
	ssl_certificate /etc/ssl/certs/rosegold.ga.pem;
    ssl_certificate_key /etc/ssl/private/rosegold.ga.key;
    ssl_client_certificate /etc/ssl/certs/origin-pull-ca.pem;
    ssl_verify_client on;

	# routing
	location / {
		proxy_set_header HOST $host;
		proxy_set_header X-Forwarded-Proto $scheme;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		# rewrite ^/nes-emu(.*)$ $1 break;
		proxy_pass http://rosegold;
	}
}

server {
	# protocol and url settings
    listen 80;
    server_name rosegold.ga m.rosegold.ga www.rosegold.ga;
    return 301 https://$server_name$request_uri;
}