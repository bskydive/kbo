# Docker

 * artifactory cli login 
	`docker login https://artifactory.company.com:0000/artifactory/project-name-docker`
 * [docker AWS](https://habrahabr.ru/post/310460/)
 * [перимущества docker 2016](https://habrahabr.ru/post/277699/)
 * [разделение окружений](https://habrahabr.ru/post/327698/)
 * [docker-iptables](https://blog.andyet.com/2014/09/11/docker-host-iptables-forwarding/)
 * [install debian](https://docs.docker.com/engine/installation/linux/debian/)
 * [nginx+docker](https://gist.github.com/cboettig/8643341bd3c93b62b5c2)
 * [Самый маленький Docker-образ — меньше 1000 байт](https://habr.com/company/flant/blog/413959/)
    * https://zwischenzugs.com/2018/05/22/a-docker-image-in-less-than-1000-bytes/
 * [Контейнеры для взрослых (Часть 01): Практический гид по терминологии](https://habr.com/company/redhatrussia/blog/421663/)   
 * [Контейнеры для взрослых (Часть 02): Практический гид по терминологии](https://habr.com/company/redhatrussia/blog/416827/)
 * [Контейнеры для взрослых (Часть 03): 10 вещей, которые не надо делать с контейнерами](https://habr.com/company/redhatrussia/blog/421663/)

 ```bash
zypper in docker python3-docker-compose
# allow in firewall docker-swarm and docker-registry
systemctl enable docker
cd ./docker
docker build -t dff docker-foo-frontend
docker build -t dfb docker-foo-backend
alias ffrs="docker rm dff; docker run -p 4200:4200 --name dff docker-foo-frontend; docker ps"
alias fbrs="docker rm dfb; docker run -p 5000:5000 --name dff docker-foo-backend; docker ps"
alias ffr="docker start dff; docker ps"
alias fbr="docker start dfb; docker ps"
alias ds="docker stop dff dfb; docker ps"
 ```

```bash
docker images
docker images -a
docker rmi 800e8b15fa9b
Error response from daemon: conflict: unable to delete 800e8b15fa9b (must be forced) - image is being used by stopped container d0e2e5f44b23
docker rm d0e2e5f44b23

ls /var/lib/docker/volumes
docker volume prune
```

* [How to cleanup (unused) resources](https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430)
