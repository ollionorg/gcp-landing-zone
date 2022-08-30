# GCP LZ UI

## Prerequisites

- Python3 should be installed
- Python3 Path should be present in env
- Application requires port 9000 and 8080 available

## To run UI locally

1. Make the script executable

```
chmod +x start_backend.sh
chmod +x start_frontend.sh
```

2. Set required environment variables (if required)

```
API_URL=9000
```

4. Set required Meta Variables

   VUE_APP_GIT_TOKEN:- This token is require while fetching the merge status of pr in deployment stage
   VUE_APP_SECRETKEY:- This token is require for LocalStorage Encryption and it must be 10 character long

   ```html
   - <meta property="VUE_APP_GIT_TOKEN" content="paste token here" /> -
   <meta property="VUE_APP_SECRETKEY" content="paste token here" />
   ```

   maintain above variable in index.html file under head tag

5. Run the application

- Run backend

```
sh start_backend.sh
```

This would spin up the backend on specified port(9000 by default)
Starting http://127.0.0.1:9000

- Run frontend

```
sh start_frontend.sh
```

This would spin up the UI on default port 8080 \
Serving HTTP on 127.0.0.1 port 8080 (http://127.0.0.1:8080/) ...
