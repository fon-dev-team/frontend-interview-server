<p align="center">
  <a href="https://fontech.com/" target="blank"><img src="https://fontech.com/wp-content/uploads/sites/3/2018/06/fontech_logo.png" width="320" alt="Fontech Logo" /></a>
</p>

## Description

[Nest](https://github.com/nestjs/nest) server made to be used in frontend interviews.

## Installation

```bash
$ npm install
```

**NOTE: To run this project you must have docker and docker compose installed**

## Starting server

```bash
$ docker-compose up 
```

## Server E/R diagram

<p align="center">
  <img src="https://www.lucidchart.com/publicSegments/view/7c88c817-9831-4e48-8418-126d86433a3a/image.jpeg" width="700" alt="E/R" />
</p>

## Server API

| Endpoint                             | Verbs                  |
|--------------------------------------|------------------------|
| /teams                               | GET                    |
| /specialties/{id}                    | GET, POST, PUT, DELETE |
| /users/{id}                          | GET, POST, PUT, DELETE |
| /users/{userId}/developers/{userId}  | GET, POST, DELETE      |
| /users/{userId}/specialties/{userId} | GET, POST, DELETE      |

## Commands

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# incremental rebuild (webpack)
$ npm run webpack
$ npm run start:hmr

# production mode
$ npm run start:prod
```
