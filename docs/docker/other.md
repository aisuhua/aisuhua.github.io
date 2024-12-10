# 其他

NAME/NODE DRIVER/ENDPOINT STATUS  BUILDKIT                              PLATFORMS
default * docker                                                        
  default default         running v0.11.7-0.20230525183624-798ad6b0ce9f linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386


curl --silent --request GET ${REPO}/${PROJECT}/${IMAGE}/manifests/${TAG}


curl https://10.0.0.1:5000/v2/test/manifests/v1 -H 'Accept: application/vnd.oci.image.index.v1+json'
curl -sS -X DELETE https://10.0.0.1:5000/v2/test/manifests/v1


docker buildx ls
docker build -t 10.0.0.1:5000/test:v1 --platform linux/arm64,linux/amd64 --push .
docker run --privileged --rm tonistiigi/binfmt --install all

## ref

- https://docs.docker.com/build/building/multi-platform/
- https://docs.docker.com/build/concepts/overview/
- https://github.com/docker/buildx/issues/59#issuecomment-1168619521
- https://blog.csdn.net/liuzhenghua66/article/details/140269971
