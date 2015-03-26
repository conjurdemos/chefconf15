# chefconf15

Repo for Conjur's ChefConf15 workshop

## Deploy box

The deploy container is responsible for uploading new cookbooks to the Chef server.

Create a Conjur identity

```
cd deploy
conjur host create deploy | conjurize > conjurize.sh
```

Build the image

```
docker build -t deploy .
```

Run it in the background
```
docker run --name=deploy -d deploy
```

Conjurize it
TODO - how do we want to do this?

Mount cookbooks and run a deploy
TODO
