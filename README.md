# 📱 Expert Maintenance Mobile App

Welcome to the **Expert Maintenance Mobile App** project! This Android application is designed to help the maintenance teams of "Expert Maintenance" manage and track their interventions efficiently. The app synchronizes data between a local SQLite database and a remote MySQL database, ensuring that all information is up-to-date.

## 📋 Project Overview

The goal of this project is to develop a mobile application that allows maintenance teams to:
- Authenticate and log in securely.
- Synchronize data between the mobile app and the web application.
- View and manage daily interventions.
- Capture and store images related to interventions.
- Navigate to intervention sites using Google Maps.

## 🛠️ Features

- **User Authentication**: Secure login for maintenance personnel.
- **Data Synchronization**: Automatic synchronization of data between the local SQLite database and the remote MySQL database.
- **Intervention Management**: View, add, modify, and delete interventions.
- **Image Capture**: Capture and store images related to interventions.
- **Google Maps Integration**: Navigate to intervention sites using Google Maps.

## 📱 Screenshots

!Login Screen
!Intervention List
!Intervention Details

## 🚀 Getting Started

### Prerequisites

- Android Studio
- XAMPP (v3.2.4) for MySQL database management

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Ztat-Taher/Expert-Maintenance.git
   ```
2. **Open the project in Android Studio**.
3. **Set up the MySQL database**:
   - Import the provided SQL script to create the necessary tables.
4. **Configure the app**:
   - Update the database connection settings in the app.

### Running the App

1. **Build and run the app** in Android Studio.
2. **Log in** using the provided credentials.
3. **Synchronize data** and start managing interventions!

Sure! Here's the complete database schema for the application:

---

## 📄 Database Schema
The application uses the following database schema:

### Clients
- `id`: INT
- `nom`: VARCHAR
- `adresse`: TEXT
- `tel`: VARCHAR
- `fax`: VARCHAR
- `email`: VARCHAR
- `contact`: VARCHAR
- `telcontact`: VARCHAR
- `valsync`: INT

### Interventions
- `id`: INT
- `titre`: VARCHAR
- `datedebut`: DATE
- `datefin`: DATE
- `heuredebutplan`: TIME
- `heurefinplan`: TIME
- `commentaires`: TEXT
- `dateplanification`: DATE
- `heuredebuteffect`: TIME
- `heurefineffect`: TIME
- `terminee`: BOOLEAN
- `dateterminaison`: DATE
- `validee`: BOOLEAN
- `datevalidation`: DATE
- `valsync`: INT

### Employes
- `id`: INT
- `login`: VARCHAR
- `pwd`: VARCHAR
- `prenom`: VARCHAR
- `nom`: VARCHAR
- `email`: VARCHAR
- `actif`: BOOLEAN
- `valsync`: INT

### Contrats
- `id`: INT
- `datedebut`: DATE
- `datefin`: DATE
- `redevence`: DECIMAL
- `client_id`: INT
- `valsync`: INT

### Sites
- `id`: INT
- `longitude`: DECIMAL
- `latitude`: DECIMAL
- `adresse`: TEXT
- `rue`: VARCHAR
- `codepostal`: INT
- `ville`: VARCHAR
- `contact`: VARCHAR
- `telcontact`: VARCHAR
- `client_id`: INT
- `valsync`: INT

### Images
- `id`: INT
- `nom`: TEXT
- `img`: LONGBLOB
- `dateCapture`: DATE
- `intervention_id`: INT
- `valsync`: INT

### Priorites
- `id`: INT
- `nom`: VARCHAR
- `valsync`: INT

### Taches
- `id`: INT
- `refernce`: VARCHAR
- `nom`: VARCHAR
- `duree`: DECIMAL
- `prixheure`: DECIMAL
- `dateaction`: DATE
- `intervention_id`: INT
- `valsync`: INT

### Employes_Interventions
- `id`: INT
- `employe_id`: INT
- `intervention_id`: INT

---

## 🤝 Contributing

We welcome contributions! Please fork the repository and submit a pull request.

## 📬 **Contact**
- Email: ztat.taher@example.com
- LinkedIn: [Ztat Taher](https://www.linkedin.com/in/ztat-taher/)

---
