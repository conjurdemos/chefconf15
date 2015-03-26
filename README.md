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

Create the secret. We'll give you the content in the workshop.

```
conjur variable create hostedchef/conjurbot/private_key
cat conjurbot.pem | conjur variable values add hostedchef/conjurbot/private_key
```

Run the deploy container interactively
```
docker run \
-e CONJUR_AUTHN_LOGIN=host/$(cat deploy.json | jsonfield id) \
-e CONJUR_AUTHN_API_KEY=$(cat deploy.json | jsonfield api_key) \
-it deploy bash
```

Verify identity and access
```
$ conjur authn whoami
{"account":"demo","username":"host/deploy"}

$ conjur env check
CLIENT_PEM: unavailable
error: Some variables are not available
```

Grant execute privileges on the conjurbot Chef private key

```
conjur resource permit variable:hostedchef/conjurbot/private_key host:deploy execute
```

Run the deploy container interactively, again
```
docker run \
-e CONJUR_AUTHN_LOGIN=host/$(cat deploy.json | jsonfield id) \
-e CONJUR_AUTHN_API_KEY=$(cat deploy.json | jsonfield api_key) \
-it deploy bash
```

Verify we now have access
```
$ conjur env check
CLIENT_PEM: available

conjur env run -- knife cookbook list
```