CREATE DATABASE IF NOT EXISTS ChildrenCare;
USE ChildrenCare;

-- Create Role Table
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT NOT NULL,
    role_name VARCHAR(50) NULL,
    PRIMARY KEY (role_id)
);

-- Create Room Table
CREATE TABLE Room (
    room_id INT AUTO_INCREMENT NOT NULL,
    room_meet VARCHAR(30) NULL,
    PRIMARY KEY (room_id)
);

-- Create Specialist Table
CREATE TABLE Specialist (
    specialist_id INT AUTO_INCREMENT NOT NULL,
    specialist_name VARCHAR(50) NULL,
    PRIMARY KEY (specialist_id)
);

-- Create TimeSlot Table
CREATE TABLE TimeSlot (
    slot_id INT AUTO_INCREMENT NOT NULL,
    slot_time VARCHAR(30) NULL,
    PRIMARY KEY (slot_id)
);

-- Create Account Table
CREATE TABLE Account (
    acc_id INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (acc_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id) ON DELETE CASCADE
);

-- Create Manager Table
CREATE TABLE Manager (
    manager_id INT AUTO_INCREMENT NOT NULL,
    acc_id INT NULL,
    first_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    phone VARCHAR(10) NULL,
    PRIMARY KEY (manager_id),
    FOREIGN KEY (acc_id) REFERENCES Account(acc_id) ON DELETE CASCADE
);

-- Create DoctorProfile Table
CREATE TABLE DoctorProfile (
    profile_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    dob DATE NULL,
    avatar VARCHAR(50) NULL,
    sex TINYINT(1) NULL,
    address_hospital VARCHAR(50) NULL,
    PRIMARY KEY (profile_id)
);

-- Create Doctor Table
CREATE TABLE Doctor (
    doctor_id INT AUTO_INCREMENT NOT NULL,
    acc_id INT NULL,
    specialist_id INT NULL,
    profile_id INT NOT NULL UNIQUE,
    room_id INT NULL,
    PRIMARY KEY (doctor_id),
    FOREIGN KEY (acc_id) REFERENCES Account(acc_id) ON DELETE CASCADE,
    FOREIGN KEY (specialist_id) REFERENCES Specialist(specialist_id),
    FOREIGN KEY (profile_id) REFERENCES DoctorProfile(profile_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- Create Pharmacy Table
CREATE TABLE Pharmacy (
    pharmacy_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NULL,
    content TEXT NULL,
    manager_id INT NULL,
    price DECIMAL(10, 2) NULL,
    PRIMARY KEY (pharmacy_id),
    FOREIGN KEY (manager_id) REFERENCES Manager(manager_id) ON DELETE SET NULL
);

-- Create Blog Table
CREATE TABLE Blog (
    blog_id INT AUTO_INCREMENT NOT NULL,
    manager_id INT NULL,
    content TEXT NULL,
    time DATETIME NULL,
    PRIMARY KEY (blog_id),
    FOREIGN KEY (manager_id) REFERENCES Manager(manager_id) ON DELETE SET NULL
);

-- Create User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    phone VARCHAR(10) NULL,
    address VARCHAR(50) NULL,
    avatar VARCHAR(50) NULL,
    sex TINYINT(1) NULL,
    acc_id INT NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (acc_id) REFERENCES Account(acc_id) ON DELETE CASCADE
);

-- Create Patient Table
CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT NOT NULL,
    user_id INT NULL,
    name VARCHAR(50) NULL,
    dob DATE NULL,
    avatar VARCHAR(50) NULL,
    sex TINYINT(1) NULL,
    patient_note VARCHAR(50) NULL,
    PRIMARY KEY (patient_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Create Reservation Table
CREATE TABLE Reservation (
    reservation_id INT AUTO_INCREMENT NOT NULL,
    time_slot_id INT NULL,
    doctor_id INT NULL,
    date_booking DATE NOT NULL,
    phone_contact VARCHAR(10) NULL,
    status CHAR(10) NULL,
    issue TEXT NULL,
    user_id INT NULL,
    patient_id INT NULL,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (time_slot_id) REFERENCES TimeSlot(slot_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE
);

-- Create Feedback Table
CREATE TABLE Feedback (
    fb_id INT AUTO_INCREMENT NOT NULL,
    fb_content TEXT NULL,
    fb_time DATETIME NULL,
    reservation_id INT NULL,
    user_id INT NULL,
    PRIMARY KEY (fb_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Create FeedbackReply Table
CREATE TABLE FeedbackReply (
    reply_id INT AUTO_INCREMENT NOT NULL,
    fb_id INT NULL,
    user_id INT NULL,
    reply_content TEXT NULL,
    reply_time DATETIME NULL,
    PRIMARY KEY (reply_id),
    FOREIGN KEY (fb_id) REFERENCES Feedback(fb_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Create MedicalRecord Table
CREATE TABLE MedicalRecord (
    record_id INT AUTO_INCREMENT NOT NULL,
    reservation_id INT NULL,
    doctor_id INT NULL,  -- Added reference to doctor
    disease_name VARCHAR(50) NULL,
    prescription TEXT NULL,
    record_note TEXT NULL,
    PRIMARY KEY (record_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE SET NULL
);
