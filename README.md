# Wardrobe Management System

A full-stack wardrobe management system built with **Vue 3 + TypeScript** for the frontend and **Laravel 11** for the backend. This system allows users to register, log in, and manage their clothing items by adding, editing, deleting, categorizing, and filtering them.

## Live Demo
I have a live demo for the system: [View Here](https://drive.google.com/file/d/1vQODWm7OPwHRxJeg5S-IpzWoZII1DJNm/view?usp=sharing)

## 🚀 Features
- **User Authentication** (Login/Registration)
- **Add, Edit, and Delete Clothing Items**
- **Categorize Items** (e.g., Tops, Bottoms, Shoes)
- **Filter and Search Functionality**
- **Responsive and User-Friendly UI**

## 💂️ Database Setup
The **wardrobe_db** MySQL database is required for this system. You can find the SQL dump file (`wardrobe_db.sql`) in the **`wardrobe-management/database`** folder.

### Importing the Database
1. Open MySQL or your database management tool (e.g., phpMyAdmin, MySQL CLI).
2. Create a new database:
   ```sql
   CREATE DATABASE wardrobe_db;
   ```
3. Import the database:
   ```sh
   mysql -u root -p wardrobe_db < wardrobe-management/database/wardrobe_db.sql
   ```

---

## 💂️ Folder Structure
```
project-root/
│-- wardrobe-management/   # Laravel 11 Backend
│   ├── database/          # Database folder with wardrobe_db.sql
│-- wardrobe-frontend/     # Vue 3 + TypeScript Frontend
│-- README.md              # Project Documentation
```

---

## ⚙️ Backend Setup (Laravel 11)
### Prerequisites
- PHP 8+
- Composer
- MySQL or any preferred database

### Installation
1. Navigate to the `wardrobe-management` folder:
   ```sh
   cd wardrobe-management
   ```
2. Install dependencies:
   ```sh
   composer install
   ```
3. Copy the environment file and set database credentials:
   ```sh
   cp .env.example .env
   ```
   Update `.env` with your database details:
   ```env
   DB_DATABASE=wardrobe_db
   DB_USERNAME=root
   DB_PASSWORD=
   ```
4. Run migrations and seed data:
   ```sh
   php artisan migrate --seed
   ```
5. Start the Laravel server:
   ```sh
   php artisan serve
   ```
   The backend will run on `http://127.0.0.1:8000/`

---

## 🌐 Frontend Setup (Vue 3 + TypeScript)
### Prerequisites
- Node.js
- npm or yarn

### Installation
1. Navigate to the `wardrobe-frontend` folder:
   ```sh
   cd wardrobe-frontend
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Configure environment file:
   - Create a `.env` file in the `wardrobe-frontend` directory and add:
     ```env
     VITE_API_BASE_URL=http://127.0.0.1:8000/api
     ```
4. Start the Vue development server:
   ```sh
   npm run dev
   ```
   The frontend will be available at `http://localhost:5173/`

---

## 🔌 API Endpoints (Backend)
| Method | Endpoint            | Description             |
|--------|---------------------|-------------------------|
| POST   | /api/register       | Register a new user     |
| POST   | /api/login          | Authenticate user       |
| GET    | /api/clothing       | Fetch clothing items    |
| POST   | /api/clothing       | Add a clothing item     |
| PUT    | /api/clothing/{id}  | Update a clothing item  |
| DELETE | /api/clothing/{id}  | Delete a clothing item  |

---

## 🗂️ Notes
- Ensure the backend is running before starting the frontend.
- Use **Postman** to test API endpoints.
- Users must be authenticated to manage clothing items.

---

## 🛠️ Technologies Used
### Backend (Laravel 11)
- Laravel 11
- MySQL
- PHP
- Laravel Sanctum (Authentication)

### Frontend (Vue 3 + TypeScript)
- Vue 3 with Composition API
- TypeScript
- Vue Router
- Pinia (State Management)
- Tailwind CSS

---

## 📌 Future Enhancements
- Implement user profile management
- Improve UI/UX with animations
- Add cloud storage for images

