# Steps per eseguire l'applicazione sul Docker locale o localmente senza Docker

* Scaricare Docker

* Clonare la repository con il seguente comando:

    ```
    git clone https://github.com/GaiaRossi/isa-progetto-esame
    ```

* Entrare nella directory clonata:

    ```
    cd isa-progetto-esame
    ```

* Data una nuova istanza di PostgreSQL bisogna prima creare il database, per fare ciò:
    ```
    bundle install
    npm install
    export DATABASE_HOST=localhost
    export DATABASE_PASSWORD=<inserire la password del database>
    export ADMIN_RAILS_PASSWORD=<password per utente admin>
    export STANDARD_RAILS_PASSWORD=<password per utente normale>
    rails db:create
    rails db:migrate
    rails db:seed
    ```

* Se non si vuole installare in locale un DB PostgreSQL si può creare un container con il seguente comando:
    ```
    docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=<inserire la password del database> -d postgres
    ```

* Si può servire direttamente l'applicazione, avendo tutte le dipendenze necessarie e il DB PostgreSQL funzionante e configurata:
    ```
    bundle install # se non fatto al passo prima
    npm install # se non fatto al passo prima
    export DATABASE_HOST=localhost # se non fatto al passo prima
    export DATABASE_PASSWORD=<inserire la password del database> # se non fatto al passo prima
    export ADMIN_RAILS_PASSWORD=<password per utente admin> # se non fatto al passo prima
    export STANDARD_RAILS_PASSWORD=<password per utente normale> # se non fatto al passo prima
    rails s
    ```

* Si può quindi accedere con una delle due utenze create:
    - username: admin_user password: < password admin inserita precedentemente >
    - username: standard_user password: < password standard inserita precedentemente >

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
    http://localhost:3000
    ```