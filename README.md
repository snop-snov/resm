## README
Resm is a simple resource manager that provides resources on demand.

### Requirements
* Ruby  2.2.0
* PostgreSQL 9.4.1

### Installation
For getting dependencies use this command:
```sh
$ bundle install
```
### Database creation
You should set username and password for your postgres user in database config (config/database.yml). Then create db:
```sh
$ rake db:create
```
### Database initialization
```sh
$ rake db:migrate
$ rake db:migrate RAILS_ENV=test
```
You need to set resources count and add it to db (for example 3):
```sh
$ RES_COUNT=10 rake db:seed
```
### How to run the test suite
```sh
$ rake test
```
### Usage
Starting server on custom port (for example 3000):
```sh
$ unicorn -p 3000
```
And using resm:
```sh
$ curl -X GET "http://localhost:3000/list" -i
HTTP/1.1 200 OK
Status: 200 OK
...

{"allocated":{},"deallocated":["r1","r2","r3"]}
```
