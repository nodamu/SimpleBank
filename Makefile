postgres:
    docker run --name postgres12 -p 5432\:\5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres_container createdb 	--username=root --owner=postgres simple_bank

dropdb:
	docker exec -it postgres_container dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:changeme@localhost:5432/SimpleBank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:changeme@localhost:5432/SimpleBank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc

