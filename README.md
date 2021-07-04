# desmos-auto-delegate

This script provides periodically withdraw staking rewards and delegate them to a validator. This script works based on the Cosmos SDK.

Instructions are following:

```
git clone https://github.com/techwomen35/desmos-auto-delegate.git
cd desmos-auto-delegate
chmod +x delegate.sh

crontab -e
```

crontab should be the following:

```
0 */3 * * * /delegate.sh
```

this crontab code provides to run the delegate.sh for every 3 hours
