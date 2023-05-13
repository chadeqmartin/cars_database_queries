# Cars Database

This is an example database with the following tables:

- User
- UserProfile
- Car
- CarModel
- Advertisement

![schema](/readme/schema.png)


## How to Use
After cloning this repo, you'll need to run a few commands to get your containerized db set up and running.

### Build the image
```bash
docker build -t cars_db .
```

### Run the image
```bash
docker run --name runner --rm -e POSTGRES_PASSWORD=password -d cars_db
```
### Populate the db
Get the container id of the running container:
```bash
docker ps
```
Exec (ssh) into the container:
```bash
docker exec -it <CONTAINER ID> bash
```

From within the container, run the setup script that will create and populate the table:
```bash
./runner.sh
```

### Execute queries
From within the container, access the postgres repl:
```bash
psql -h localhost -p 5432 -U postgres -d cars 
```
