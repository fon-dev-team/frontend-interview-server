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

| Endpoint                                  | Verbs                  |
|-------------------------------------------|------------------------|
| /teams                                    | GET                    |
| /specialties/{id}                         | GET, POST, PUT, DELETE |
| /users/{id}                               | GET, POST, PUT, DELETE |
| /users/{userId}/developers/{userId}       | GET, POST, DELETE      |
| /users/{userId}/specialties/{specialtyId} | GET, POST, DELETE      |

##### Team

```json
{
    "id": "7a2031bf-edde-4352-9156-2b4858bd6a21",
    "name": "Backend"
}

```
##### Specialty

```json
{
    "id": "c5442259-bc08-47af-90ea-700d3db042a1",
    "name": "Angular"
}

```
##### Developer (User)

```json
{
   "id": "45cffd30-fa95-411c-9405-9a1c138f92ea",
   "name": "Bernita",
   "surname": "Cremin",
   "age": 22,
   "email": "Skylar0@gmail.com",
   "avatar": "http://lorempixel.com/100/100",
   "type": "developer"
}

```
##### TeamLeader (User)

```json
{
    "id": "dce6a72f-4aed-46aa-9e56-784cf9f721ce",
    "name": "Freddie",
    "surname": "Dickens",
    "age": 18,
    "email": "Axel47@hotmail.com",
    "avatar": "http://lorempixel.com/100/100",
    "teamLeaderOf": "7a2031bf-edde-4352-9156-2b4858bd6a21",
    "type": "team-leader"
}

```

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
