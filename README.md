# HRM SaaS Laravel API

Laravel backend API for Employee Management System HRM SaaS training/portfolio project.

## Related repositories

Frontend:
https://github.com/ValeraKarimov/employee-management-dashboard--hr-saas-mvp-api

Backend:
https://github.com/ValeraKarimov/employee-management-dashboard--laravel-api

---

## Tech Stack

- Laravel
- Sanctum
- MySQL
- REST API

---

## Project Goal

The goal of the project is to practice building a Laravel API for a role-based HRM SaaS application.

The project includes:
- authentication
- roles/permissions
- CRUD modules
- API Resources
- protected routes
- admin/employee flows

This is a portfolio/training project, not a real production HRM system.

---

## Features

### Authentication
- login/logout
- token authentication
- current user endpoint

### Roles
- admin
- employee

### API Modules
- Users API
- Profiles API
- Leave Requests API
- Shifts API
- Documents API
- Dashboard API

### Documents
- upload documents
- delete documents
- admin access to all documents

### Leave Requests
- create leave requests
- approve/reject requests

### Shifts
- create/edit/delete shifts
- employee confirmation
- worked hours approval

### API Resources
- consistent API responses
- related user/profile/document data

---

## Getting Started

Install dependencies:

```bash
composer install
```
Setup environment:

```bash
cp .env.example .env
php artisan key:generate
```
Run migrations:

```bash
php artisan migrate
```

Run serve: 
```bash
php artisan serve
```

Backend API:
```bash
http://127.0.0.1:8000
```