# DB Config

## Overview

This repository contains the configuration for setting up multiple MongoDB databases using Docker. It includes a `docker-compose.yml` file to orchestrate multiple MongoDB containers and initialization scripts to prepopulate the databases with necessary collections and indexes.

## Repository Structure

```
/db-config
│-- docker-compose.yml
│-- mongo-init-scripts/
│   │-- auth.js
│   │-- bills.js
│   │-- chores.js
│   │-- chat.js
│   │-- notifications.js
│   │-- users.js
│-- secrets/
│   │-- auth_user.txt
│   │-- auth_password.txt
│   │-- bills_user.txt
│   │-- bills_password.txt
│   │-- chores_user.txt
│   │-- chores_password.txt
│   │-- chat_user.txt
│   │-- chat_password.txt
│   │-- notifications_user.txt
│   │-- notifications_password.txt
│   │-- users_user.txt
│   │-- users_password.txt
│-- gen_secrets.sh
│-- README.md
```

- **docker-compose.yml**: Defines multiple MongoDB services and configurations.
- **mongo-init-scripts/**: Contains initialization scripts for different databases, handling collections and indexes for:
  - Authentication (`auth.js`)
  - Bills (`bills.js`)
  - Chores (`chores.js`)
  - Chat (`chat.js`)
  - Notifications (`notifications.js`)
  - Users (`users.js`)
- **secrets/**: Contains user credentials for each database.
- **gen\_secrets.sh**: A script to generate secrets automatically.
- **README.md**: This documentation file.

## Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your machine.
- [Docker Compose](https://docs.docker.com/compose/install/) installed.

## Getting Started

1. Clone the repository:
   ```sh
   git clone git@github.com:ChamberFellas/db-config.git
   cd db-config
   ```
2. Generate the secrets folder and credentials by running:
   ```sh
   ./gen_secrets.sh
   ```
3. Start the MongoDB containers:
   ```sh
   docker compose up -d
   ```
   This will start multiple MongoDB containers in detached mode.
4. Verify the containers are running:
   ```sh
   docker ps
   ```

## Initialization Scripts

The `mongo-init-scripts/` directory contains initialization scripts that run automatically when the MongoDB containers start. Each script is responsible for setting up collections, indexes, and initial data for a specific aspect of the application.

To manually execute a script inside a running container:

```sh
docker exec -it <mongo-container-name> mongosh /docker-entrypoint-initdb.d/auth.js
```

Replace `auth.js` with the desired script name.

## Stopping and Removing Containers

To stop the database containers:

```sh
docker-compose down
```

This will also remove the associated volumes.

## Environment Variables

You can customize the MongoDB instances by modifying the `docker-compose.yml` file. Common environment variables include:

- `MONGO_INITDB_ROOT_USERNAME`
- `MONGO_INITDB_ROOT_PASSWORD`
- `MONGO_INITDB_DATABASE`

## Troubleshooting

- If a container fails to start, check logs:
  ```sh
  docker logs <mongo-container-name>
  ```
- Ensure that no other MongoDB instance is running on the same ports.

## License

This project is licensed under the MIT License.

