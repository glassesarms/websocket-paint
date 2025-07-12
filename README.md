# Websocket Paint
This is a static community painting site to practice websockets in AWS

I can deploy my site using
```
terraform apply
```

I can run
```
aws s3 sync dist/ s3://paint-websocket-bucket --delete 
```
to redeploy to my vite frontend