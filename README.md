# chefconf15

Repo for Conjur's ChefConf15 workshop

## Deploy box

The deploy container is responsible for uploading new cookbooks to the Chef server.

Build the deploy image

```
cd deploy
docker build -t deploy .
```

Create a Conjur identity

```
conjur host create deploy | tee deploy.json
```

Grant execute privileges on the conjurbot Chef private key

```
conjur resource permit host:deploy variable:hostedchef/conjurbot/private_key execute
```

Run the deploy container interactively
```
docker run \
-e CONJUR_AUTHN_LOGIN=host/$(cat deploy.json | jsonfield id) \
-e CONJUR_AUTHN_API_KEY=$(cat deploy.json | jsonfield api_key) \
-it deploy bash
```
