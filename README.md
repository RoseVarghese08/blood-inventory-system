# 🩸 Blood Inventory & Cold Chain Monitoring System

A RESTful API built with **Laravel 11** for managing blood banks, refrigerators, blood bags, temperature monitoring, and critical alert notifications.

---

# 📌 Project Overview

The Blood Inventory & Cold Chain Monitoring System helps blood banks manage blood storage efficiently by:

* Managing Blood Banks
* Managing Refrigerators
* Tracking Blood Bags
* Monitoring Refrigerator Temperature
* Detecting Critical Temperature Events
* Generating Alerts
* Sending Notifications
* Providing Dashboard Analytics

The project follows Laravel best practices using a layered architecture with Controllers, Services, API Resources, Form Requests, Events, Listeners, Queue Jobs, and Notifications.

---

# 🚀 Features

## Authentication

* Laravel Sanctum Authentication
* Login API
* Logout API
* Authenticated User API

---

## Blood Bag Management

* Create Blood Bag
* Update Blood Bag
* Delete Blood Bag
* View Blood Bag
* List Blood Bags
* Expired Blood Bags
* Expiring Blood Bags
* Near Risk Percentage

---

## Temperature Monitoring

* Store Temperature Logs
* View Temperature History
* Temperature Analytics

---

## Dashboard

Dashboard API provides:

* Total Blood Banks
* Total Refrigerators
* Total Blood Bags
* Available Blood Bags
* Expired Blood Bags
* Active Critical Alerts

---

## Alert Management

* Create Critical Alerts
* List Alerts
* View Alert
* Resolve Alert

---

## Notifications

Database Notifications are generated whenever a refrigerator reaches a critical temperature.

---

## Queue Jobs

Critical temperature notifications are processed using Laravel Queue Jobs.

---

# 🛠 Technologies Used

* Laravel 11
* PHP 8.4
* MySQL
* Laravel Sanctum
* Laravel Queue
* Laravel Notifications
* Eloquent ORM
* REST API
* Postman

---

# 📂 Project Structure

```
app
├── Events
├── Http
│   ├── Controllers
│   ├── Requests
│   └── Resources
├── Jobs
├── Listeners
├── Models
├── Notifications
└── Services

database
├── factories
├── migrations
└── seeders

routes
└── api.php
```

---

# 🧩 Laravel Concepts Used

* Authentication (Sanctum)
* Eloquent Relationships
* API Resources
* Form Requests
* Service Layer
* Events
* Listeners
* Queue Jobs
* Notifications
* Accessors
* Mutators
* Factories
* Seeders
* Eager Loading
* Database Indexing
* Caching

---

# 📡 API Endpoints

## Authentication

| Method | Endpoint      |
| ------ | ------------- |
| POST   | `/api/login`  |
| POST   | `/api/logout` |
| GET    | `/api/user`   |

---

## Blood Bags

| Method | Endpoint                    |
| ------ | --------------------------- |
| GET    | `/api/blood-bags`           |
| POST   | `/api/blood-bags`           |
| GET    | `/api/blood-bags/{id}`      |
| PUT    | `/api/blood-bags/{id}`      |
| DELETE | `/api/blood-bags/{id}`      |
| GET    | `/api/blood-bags/expired`   |
| GET    | `/api/blood-bags/expiring`  |
| GET    | `/api/blood-bags/near-risk` |

---

## Temperature Logs

| Method | Endpoint                     |
| ------ | ---------------------------- |
| GET    | `/api/temperature-logs`      |
| POST   | `/api/temperature-logs`      |
| GET    | `/api/temperature-logs/{id}` |
| PUT    | `/api/temperature-logs/{id}` |
| DELETE | `/api/temperature-logs/{id}` |

---

## Dashboard

| Method | Endpoint         |
| ------ | ---------------- |
| GET    | `/api/dashboard` |

---

## Alerts

| Method | Endpoint           |
| ------ | ------------------ |
| GET    | `/api/alerts`      |
| GET    | `/api/alerts/{id}` |
| PATCH  | `/api/alerts/{id}` |

---

# ⚙️ Installation

Clone the repository

```
git clone <repository-url>
```

Install dependencies

```
composer install
```

Copy environment file

```
cp .env.example .env
```

Generate application key

```
php artisan key:generate
```

Configure the database in `.env`.

Run migrations and seeders

```
php artisan migrate:fresh --seed
```

Start the development server

```
php artisan serve
```

Run the queue worker

```
php artisan queue:work
```

---

# 🔑 Default Admin Login

Email

```
admin@example.com
```

Password

```
password
```

---

# 📊 Database Entities

* Users
* Blood Banks
* Refrigerators
* Blood Bags
* Temperature Logs
* Alerts
* Notifications

---

# 📈 Performance Optimizations

* Eager Loading
* Database Indexes
* Dashboard Caching
* Queue Processing
* Service Layer Architecture

---

# 👨‍💻 Author

Developed using Laravel 11 as a RESTful API project for Blood Inventory and Cold Chain Monitoring.
