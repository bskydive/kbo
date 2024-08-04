# gitlab

## gitlab-ce

 * http://doc.gitlab.com/ce/
 * https://about.gitlab.com/install/
 * https://docs.gitlab.com/ee/install/docker.html
 * https://hub.docker.com/r/gitlab/gitlab-ce/tags/
 * иерархия конфигов
 	* stages
	* needs
	* dependencies
	* artifacts
	* trigger
	* dynamic pipelines
	* rollout&rollback
	* parallel exec

```bash

#version: '3.6'
services:
  gitlab:
    image: gitlab/gitlab-ce
    container_name: gitlab
    restart: unless-stopped
    hostname: 'gitlab'
    #user: gitlab
    environment:
      #- GITLAB_OMNIBUS_CONFIG='https://gitlab'
      - GITLAB_HOME='/home/gitlab/data'
    ports:
      - '180:80'
      - '1443:443'
      - '122:22'
    volumes:
      - '$GITLAB_HOME/config:/etc/gitlab'
      - '$GITLAB_HOME/logs:/var/log/gitlab'
      - '$GITLAB_HOME/data:/var/opt/gitlab'
    shm_size: '256m'
    logging:
      driver: json-file
      options:
        max-size: "1m"
        max-file: "3"
        labels: "TEST"
        mode: "non-blocking"
        tag: "{{.ImageName}}/{{.Name}}/{{.ID}}"


docker-compose run -u $(id gitlab -u):$(id gitlab -g) gitlab
docker-compose up -d

docker logs -f gitlab|less
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
# http://gitlab:180
# root@pass
docker exec -it gitlab /bin/bash
docker exec -it gitlab editor /etc/gitlab/gitlab.rb
#gitlab_rails['gitlab_shell_ssh_port'] = 122
#letsencrypt['enable'] = false

mkdir -p /etc/gitlab/ssl
chmod 755 /etc/gitlab/ssl

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout gitlab.key -out gitlab.crt -subj "/CN=gitlab"

cp gitlab.key gitlab.crt /etc/gitlab/ssl/

docker exec -it gitlab gitlab-ctl reconfigure
docker restart gitlab

exec -t gitlab gitlab-backup create
g clone ssh://git@gitlab:122/group1/frontend.git

```

 * https://docs.gitlab.com/omnibus/settings/ssl/index.html#configure-https-manually
 * https://docs.gitlab.com/omnibus/settings/configuration.html#configuring-the-external-url-for-gitlab

### backup

 * http://doc.gitlab.com/ce/raketasks/README.html

    ```bash
    gitlab-rake gitlab:backup:create
    ```
### restore

 * http://doc.gitlab.com/ce/raketasks/backup_restore.html#for-omnibus-installations

```bash
	# Stop processes that are connected to the database
	sudo gitlab-ctl stop unicorn
	sudo gitlab-ctl stop sidekiq

	# This command will overwrite the contents of your GitLab database!
	sudo gitlab-rake gitlab:backup:restore BACKUP=1393513186

	# Start GitLab
	sudo gitlab-ctl start

	# Check GitLab
	sudo gitlab-rake gitlab:check SANITIZE=true
```

 * http://doc.gitlab.com/ce/logs/logs.html

```bash
	# Tail all logs; press Ctrl-C to exit
	sudo gitlab-ctl tail

	# Drill down to a sub-directory of /var/log/gitlab
	sudo gitlab-ctl tail gitlab-rails

	# Drill down to an individual file
	sudo gitlab-ctl tail nginx/gitlab_error.log
```