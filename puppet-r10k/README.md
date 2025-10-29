# docker

## rm image
```rmi ghcr.io/teamzuzu/puppet-r10k:main```

## normal run
```docker run  -it --rm --entrypoint=bash ghcr.io/teamzuzu/puppet-r10k:main ```

## run with key
```docker run  -it --rm --entrypoint=bash -v /home/zuzudevops/.ssh:/root/.ssh ghcr.io/teamzuzu/puppet-r10k:main```

# k8s

##  normal run
```kubectl run -i --tty --rm --image=ghcr.io/teamzuzu/puppet-r10k:main puppet-r10k --command bash```
