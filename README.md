# CareFlow Patient Service

Minimal Spring Boot microservice for managing patients. It uses Java 25, MySQL, Spring Data JPA, Eureka discovery, and Spring Boot Actuator.

## Requirements

- JDK 25
- MySQL
- Eureka server at `http://localhost:8761/eureka/`

## Configuration

The service runs on port `8081`. Configure MySQL with environment variables:

| Variable | Default |
| --- | --- |
| `DB_URL` | `jdbc:mysql://localhost:3306/careflow_patient_db` |
| `DB_USERNAME` | `root` |
| `DB_PASSWORD` | `password` |

Create the `careflow_patient_db` database before starting the service. Hibernate creates or updates the table schema.

## Run

On macOS or Linux:

```shell
./mvnw spring-boot:run
```

On Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

## API

| Method | Endpoint | Description |
| --- | --- | --- |
| `POST` | `/api/patients` | Create a patient |
| `GET` | `/api/patients` | List all patients |
| `GET` | `/api/patients/{id}` | Get a patient |
| `PUT` | `/api/patients/{id}` | Update a patient |
| `DELETE` | `/api/patients/{id}` | Delete a patient |

Example request body:

```json
{
  "name": "Jane Doe",
  "email": "jane@example.com",
  "phone": "+1-555-0100"
}
```

Actuator health is available at `GET /actuator/health`.
