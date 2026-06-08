CREATE TABLE patients (
   PATIENT_ID int NOT NULL,
   PATIENT_NAME varchar(100) NOT NULL,
   GENDER enum('MALE','FEMALE','OTHER') NOT NULL,
   DOB date DEFAULT NULL,
   phone varchar(15) DEFAULT NULL,
   ADDRESS varchar(200) DEFAULT NULL,
   BLOOD_GROUP varchar(5) DEFAULT NULL,
 );

 CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled','Completed','Cancelled')
            DEFAULT 'Scheduled',

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    diagnosis VARCHAR(200),
    treatment_details TEXT,

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id)
);

CREATE TABLE billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    bill_date DATE DEFAULT (CURRENT_DATE),
    payment_status ENUM('Paid','Pending')
                   DEFAULT 'Pending',

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id)
);

CREATE TABLE appointment_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);