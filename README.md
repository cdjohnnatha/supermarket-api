# Supermarket API
Supermarket back-end.

That API is used for create new supermarkets with products where each product have a smallest and highest price and you can search by bar code.  

---

## Requirements

* **[Docker 17.05.0-ce](https://www.docker.com/)**
* **[docker-compose 1.11.2](https://docs.docker.com/compose/)**

### Installation

**In the path cloned folder**
  
  ```
    make build
    make create-db
    make yarn-install
    make up
  ```
---

## Swagger Docs

1. If you want to access swagger doc, run:
  - access in your browser: `http://localhost:3000/v1/docs`
  
---

## API Routes ##

|   Action                                 | Method         | URL                                               
| -----------------------------------------|----------------|----------------------------------------------------- 
|    Swagger Docs                          |   `GET`        | /v1/docs              
|    Get User Token                        |   `POST`       | /v1/user_token              
|    List All Users                        |   `GET`        | /v1/users              
|    Create New User                       |   `POST`       | /v1/users              
|    Show User                             |   `GET`        | /v1/users/id              
|    Update User                           |   `PATCH/PUT`  | /v1/users/id              
|    Delete User                           |   `DELETE`     | /v1/users/id              
|    Index Supermarket                     |   `GET`        | /v1/supermarkets
|    Create Supermarket                    |   `POST`       | /v1/supermarkets              
|    Show Supermarket                      |   `GET`        | /v1/supermarkets/id              
|    Update Supermarket                    |   `PATCH/PUT`  | /v1/supermarkets/id              
|    Delete Supermarket                    |   `DELETE`     | /v1/supermarkets/id              
---

## Contributors

> Cláudio Djohnnatha ([cdjohnnatha](https://github.com/cdjohnnatha)) cdjohnnatha@gmail.com

---
