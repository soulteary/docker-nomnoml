# Docker Nomnoml

> Dockerized Nomnoml by Nginx 1.24.0 And NJS.

Docker Nomnoml is a simple but elegant self-hosted UML Generator & UML Sharing solution.

## usage

```bash
# get the docker image as your like
docker pull soulteary/nomnoml
docker pull soulteary/nomnoml:njs
# run the nomnoml one-click
docker run --rm -it -p 8080:80 soulteary/nomnoml
```

Base Nginx official docker image, for more information, refer to nginx container image [usage](https://hub.docker.com/_/nginx).

## Components

Does not include any software other than nginx and nomnoml, so that the resource usage is **very small** and the **performance is high enough**.

### Nomnoml

The sassy UML diagram renderer, created by [@Daniel Kallin](https://github.com/skanaar/) at [3 Jun 2014](https://github.com/skanaar/nomnoml/commit/211d19390d3615d86bced243c5878b8f4d535736).

- [Nomnoml Docs](https://github.com/skanaar/nomnoml#web-application)
- [Offical Website](https://www.nomnoml.com/)
- [GitHub Repo](https://github.com/skanaar/nomnoml)

### Nginx / NJS

This Project use **Nginx script language (njs)** instead of Node as a server-side image generation solution.

List some learning materials to help you step into the world of njs. Thanks to these open source authors and engineer of Nginx/F5, inc.

- [soulteary/njs-learning-materials](https://github.com/soulteary/njs-learning-materials)

## Benchmark

TBD

