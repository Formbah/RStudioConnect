Exercise 1
1. Where/how would you recommend we begin to deploy this application's infrastructure? (Just a few words, not a full description of the architecture, that's later!)
Containerization or the containerized approach would be most appropriate in deploying the Node.js application independently of its existing platform since it would package the code of the application and its dependencies and runtime environment into a single container which can deploy in any Kubernetes cluster. In this light, the following steps can be followed.
-       Create separate dedicated deployment environment such as a containerized environment so that it is isolated from existing platform.
-       Ensure that the API gateway is implemented that will act as an interferer or intermediary between the application and the existing platform, to control and manage API access, versioning, and security.
-       Node.js should be containerized using Docker so that the application and all its dependencies are packaged for easy deployment and scalability.
-       Use IaC tool like Terraform to define and provision the infrastructure for the new application.
-       Ensure that the application has a separate database instance since it does not require access to existing platform’s database, although both could be hosted on the same database but with distinct credentials and control.
 
2. What CI/CD system(s) would you recommend in this case?
Jenkins would be the recommended CI/CD system because it is popular and widely used to automate a build, test the build, and deploy the new application through a pipeline that is triggered automatically when the code is pushed to the repo.
3. What approach would you recommend to host the front end and why?
Content Delivery Network (CDN) would be recommended to host the static front-end website. This is a network of servers spread around the world that helps deliver content to end users ensuring low latency and high availability. Case in point for CDN is Amazon CloudFront.
Using CDN, firstly, upload static website file to the CDN server, then update the Website’s DNS records to point to the CDN server.
CDN is recommended here because of the following benefits:
It improves performance of the static website by ensuring that there is low latency and higher load load-time.
It is highly available as the website is accessed by users even if some of the servers are down.
It easily scales up or down, depending on the traffic at the specific time.
4. Provide a brief description of the main components/cloud services you would use in both approaches
Approach 1: Single Web Application for all 20 API Endpoints
Main Components/Cloud Services:
-       Web Application: Node.js
-       API Gateway: Managing routing and authentication of endpoint.
-        Compute Service: Container instance (Docker) to run the application.
-       Database: MySQL database to store data
-       AWS CloudWatch to monitor performance and other logging issues.
Advantages: 
-       It is easy to develop and manage a single codebase.
-       There is high performance because there is lower latency in endpoint communication since they share same resources.
-       Authentication is simplified because of centralized authentication and authorization logic.
-       Cost saving hosting all resources in a single server.
-       Code is easily shared by resources and reusable.
Disadvantages
-       Scaling could be a challenge if some endpoints require more resources than others.
-       Updates or changes to one endpoint could affect others. 
-       Testing too may be complex considering the fact that it is a large monolithic application.
-       Deployment may also encounter some complexities which may require downtime and careful orchestration.
-       Some unused endpoints may unnecessarily consume resources.
Approach 2: Individual Functions for Each API Endpoint
Main Components/Cloud Services:
-       Function as a Service (FaaS) platform or Serverless Computing such as AWS Lambda
-       API Gateway
-       Database: MySQL
-       AWS CloudWatch
-       Docker
Advantages:
-       Individual functions would scale perfectly depending on specific requirements.
-       Updates and changes to one endpoint would not affect or impact other functions, thus improving isolation.
-       Pay only for the resources used by each function.
-       Flexible deployment – easy CI/CD deployment
-       Unit and integration testing is easier because of smaller and focused codebases.
Disadvantages:
-       Complex to manage multiple functions as the number of endpoints increase.
-       FaaS using serverless functions may experience increased latency due to cold start.
-       Implementation of authentication and authorization to each function may be cumbersome.
-       Resource fragmentation and inefficiency may occur because of smaller functions. 
5. What are the main considerations for creating a database?
If we consider a database as a body of information saved in a framework or a secured environment that is made easy to search, then the following would be considered in creating one:
-       Performance is very important because the database should be able to handle the traffic on the application. It should take into consideration the users’ traffic, the data type and the volume of data to ne stored. The engine type too should be suitable for the application needs.
-       Scalability of the database should be considered very early enough to be sure that the database would be able to handle many users and more data without compromising performance. Here, vertical scalability (more resources to the same server) or horizontal scalability (more servers) should be considered.
-       The database should be built with reliability in mind, that is, it should be trusted to be able to be available 24/7 and be able to recover from failure fast, to reduce downtime.
-       Security of the data too is primal as it should be implemented to ensure that sensitive data should not be accessed by unauthorized actors. A robust authentication and authorization system should be implemented, and encryption should be both at rest and in transit.
6. What would the architecture look like?
Since a backend application has the structure and logic of the website with components not visible to the user, a relational database management system is appropriate since they are built to handle structured data such as customer information, product data and order data. In this light, the architecture will be composed of the following:
Database server: Where the database engine runs. Responsible for storing, retrieving, and processing.
Database instance: The Running instance of the DB server. Contains the DB schema and data.
Database Schema: Defines the structure of the DB. Includes tables, columns, and relationship between tables.
Tables: Store actual data
Indexes: used to speed up data retrieval
7. How would you deploy schema changes across environments?
Use the database version control system which will track and manage changes to the database schema. This is useful both for deploying schema changes across multiple environments as well as rolling back changes when necessary.
Deploying the schema to multiple environments will be as follows:
Develop and test schema in the development environment and use version control to track changes.
Use version control system to deploy schema changes in staging environment.
Deploy schema changes using Jenkins CI/CD pipeline in the production environment.
Monitor the production environment post-deployment to be sure that the database is functioning properly and resolve unexpected issues promptly.
8. Provide a high-level indication of what parts of the system you would monitor to achieve 99% uptime for this application
- The application: ensure that the application is available and responsive, noting the response time of the application’s API endpoints and the error rates and exceptions that occur. Also monitor the utilization of resources such as the CPU, memory, and disk usage for bottlenecks.
- The database: monitor the performance and availability of the database, tracking execution time of queries and note slow queries that affect performance of application. Database connection pool should be healthy and managed properly.
- The infrastructure: monitor the infrastructure that the application is running on, from the servers, load balancer’s health and performance, and network response time.
- The security: monitor and note security events such as failed authentications and unauthorized access.
- Third-party services: monitor the third parties that the application may rely on, which may include payment, email, and SMS services.
- Other things to monitor include database replication and backup, users’ experience, scheduled jobs and background processes and scalability.

Exercise 2
Still working on the first part