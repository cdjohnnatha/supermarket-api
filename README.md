# Supermarket API
Supermarket back-end test.

---

### Requirements ###

* **[Docker 17.05.0-ce](https://www.docker.com/)**
* **[docker-compose 1.11.2](https://docs.docker.com/compose/)**

### Installation ###

  - user@user:~/path_to_cloned_folder$ **make build**
  - user@user:~/path_to_cloned_folder$ **make create-db**
  - user@user:~/path_to_cloned_folder$ **make yarn-install**
  - user@user:~/path_to_cloned_folder$ **make up**
  - **Manually install the dependencies that may have not been installed by the above command.**

1. If you want to access swagger doc, run:
  - access in your browser: `http://localhost:3000/v1/docs`

---

## API Routes ##

### Author ###
|   Action                                 | Method         | URL                                               
| -----------------------------------------|----------------|----------------------------------------------------- 
|    Swagger Docs                          |   `GET`        | /v1/docs              
|    Get User Token                        |   `POST`       | /v1/user_token              
|    List All Users                        |   `GET`        | /v1/users              
|    Create New User                       |   `POST`       | /v1/users              
|    Show User                             |   `GET`        | /v1/users/id              
|    Update User                           |   `PATCH/PUT`  | /v1/users/id              
|    Delete User                           |   `DELETE`     | /v1/users/id              



---

## Contributors

> Cláudio Djohnnatha ([cdjohnnatha](https://github.com/cdjohnnatha)) cdjohnnatha@gmail.com

---
