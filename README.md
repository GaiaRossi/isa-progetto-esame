# Steps per eseguire l'applicazione sul Docker locale

* Scaricare Docker

* Clonare la repository con il seguente comando:

    ```
    git clone https://github.com/GaiaRossi/isa-progetto-esame
    ```

* Entrare nella directory clonata:

    ```
    cd isa-progetto-esame
    ```
* Creare il file .env che contiene le variabili d'ambiente utili per i container docker. Le informazioni che devono essere presenti sono:

    - DATABASE_PASSWORD: password per l'accesso al db PostgreSQL
    - ADMIN_RAILS_PASSWORD: password per utente admin
    - STANDARD_RAILS_PASSWORD: password per utente standard
    - DATABASE_HOST: nome dell'host che ospita il database

* Creare i container dell'applicazione:

    ```
    docker compose up
    ```

* Una volta creati i container, è possibile utilizzare l'applicazione visitando:

    ```
    https://localhost:3000
    ```