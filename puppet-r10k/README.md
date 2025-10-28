# docker

## rm image
```rmi ghcr.io/teamzuzu/puppet-r10k:main```

## normal run
```docker run  -it --rm --entrypoint=bash ghcr.io/teamzuzu/puppet-r10k:main ```

## run with key
```docker run  -it --rm --entrypoint=bash -v /home/simonc/.ssh:/root/.ssh ghcr.io/teamzuzu/puppet-r10k:main```
