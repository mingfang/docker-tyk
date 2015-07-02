# docker-tyk
Run Tyk Inside Docker

Includes
 - Tyk API Gateway
 - Tyk Dashboard
 - Redis
 - MongoDB

All the process are managed by Runit automatically.

#Use
1. Build Docker image user the ```./build``` script
2. Run the entire stack using the ```./run``` script
3. To create a test user, docker exec into the container and run the ```/newuser``` script.

#Dashboard
The Dashboard is exposed on port 3000.

Login as ```user@test.com``` with password ```test123```, if you use the ```/newuser``` script above.

#Gateway

The Gateway is exposed on port 8080.

#Note
This image was intented only for testing the entire Tyk stack quickly using Docker.
