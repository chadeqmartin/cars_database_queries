# Cars Database

This is an example database with the following tables:

- User
- UserProfile
- Car
- CarModel
- Advertisement

![schema](/readme/schema.png)

### How to Use Without Docker (do this if you're not sure)

1. Clone this repo
2. In project root of this repo log into postgres: `psql`
3. Run the init sql file in psql to create the database, its schema, and populate it with mock data: `\i ./init.sql`
4. Confirm the database exists and has data with some simple `SELECT` queries.

### How to Use With Docker

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

### Execute queries
From within the container, access the postgres repl:
```bash
psql -h localhost -p 5432 -U postgres -d cars 
```


## Running a SQL Script

If you want to directly connect to the container using your host machine's psql client, you'll need to expose a port:
```bash
docker run --name runner --rm -e POSTGRES_PASSWORD=password -p 5454:5432 -d cars_db
```

From there, if you want to execute a SQL script, run:
```bash
psql -h localhost -p 5454 -U postgres -d cars -f script.sql
```

If you get tired of entering your password each time, you can pass it in as an environment variable:
```bash
PGPASSWORD=password psql -h localhost -p 5454 -U postgres -d cars -f script.sql
```
