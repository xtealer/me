#
# Virtual Host configuration for parents.rosegold.ga
#

server {
	# domain and protocol settings
	listen 443 ssl;
	server_name parents.rosegold.ga;
	
	# ssl settings
	ssl_certificate /etc/ssl/certs/rosegold.ga.pem;
    ssl_certificate_key /etc/ssl/private/rosegold.ga.key;
    ssl_client_certificate /etc/ssl/certs/origin-pull-ca.pem;
    ssl_verify_client on;

    # redirect to figma url
    return 301 https://www.figma.com/proto/uxFlZN2jKCKWtjFtl9HnXP/RoseGold?node-id=14%3A45&scaling=scale-down;
}

server {
    listen 80;
    server_name parents.rosegold.ga;
    
    # redirect to figma url
    return 301 https://www.figma.com/proto/uxFlZN2jKCKWtjFtl9HnXP/RoseGold?node-id=14%3A45&scaling=scale-down;
}