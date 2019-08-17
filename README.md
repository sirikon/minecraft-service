# Minecraft Service

All the necessary scripts to manage a Minecraft Server

## Usage

First, clone this repository to wherever you want.

Then, download your favorite Minecraft Server implementation. (It can be the
official one, Spigot, Bukkit...) and put it in a new folder called `server`.

Now, create a file called `.env` at the repository root, like this:

```bash
MINECRAFT_SERVICE_BINARY_NAME=minecraft-1.14.4.jar
MINECRAFT_SERVICE_JAVA_RAM=6G
```

Edit for your needs.

Finally, run this to run the server the first time:

```bash
./scripts/run.sh
```

If everything works properly, use this to install the Systemd service:

```bash
./scripts/install-systemd-service.sh
```

And then:

```bash
./scripts/start-service.sh
```
