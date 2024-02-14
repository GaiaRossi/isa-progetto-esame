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

* Si può servire direttamente l'applicazione, avendo tutte le dipendenze necessarie e il DB PostgreSQL funzionante:
    ```
    export DATABASE_HOST=localhost
    export DATABASE_PASSWORD=<inserire la password>
    export ADMIN_RAILS_PASSWORD=<password per utente admin>
    export STANDARD_RAILS_PASSWORD=<password per utente normale>
    rails s
    ```

* Oppure si può creare il docker compose, ma bisogna eliminare le credenziali già presenti con:
    ```
    rm ./config/credentials.yml.enc
    ```

* Creare una nuova master key:
    ```
    rails credentials:edit
    ```

* Creare il file .env che contiene le variabili d'ambiente utili per i container docker. Le informazioni che devono essere presenti sono:

    - DATABASE_PASSWORD: password per l'accesso al db PostgreSQL
    - ADMIN_RAILS_PASSWORD: password per utente admin
    - STANDARD_RAILS_PASSWORD: password per utente standard
    - RAILS_MASTER_KEY: chiave generata al passo precedente

* Creare i container dell'applicazione:

    ```
    docker compose up
    ```

* Una volta creati i container, è possibile utilizzare l'applicazione visitando:

    ```
    https://localhost:3000
    ```