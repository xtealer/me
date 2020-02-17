#
# Virtual Host configuration for nes.xtealer.ml
#

upstream nesemu {
	server nesapp-1:3000;
}

server {
	# domain and protocol settings
	listen 443 ssl;
	server_name nes.xtealer.ml;
	
	# ssl settings
	ssl_certificate /etc/ssl/certs/xtealer.ml.pem;
    ssl_certificate_key /etc/ssl/private/xtealer.ml.key;
    ssl_client_certificate /etc/ssl/certs/origin-pull-ca.pem;
    ssl_verify_client on;

	# routing
	location / {
		proxy_set_header HOST $host;
		proxy_set_header X-Forwarded-Proto $scheme;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		# rewrite ^/nes-emu(.*)$ $1 break;
		proxy_pass http://nesemu;
	}
}

server {
    listen 80;
    server_name nes.xtealer.ml;
    return 301 https://$server_name$request_uri;
}