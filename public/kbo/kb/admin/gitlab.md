# gitlab

## gitlab-ce

 * http://doc.gitlab.com/ce/

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