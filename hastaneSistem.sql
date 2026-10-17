USE HastaneDB;

CREATE TABLE Poliklinik (
    Poliklinik_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Poliklinik_Adi VARCHAR(100) NOT NULL
);

CREATE TABLE Doktor (
    Doktor_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Poliklinik_sutun INT,
    FOREIGN KEY (Poliklinik_sutun) REFERENCES Poliklinik(Poliklinik_sutun)
);

CREATE TABLE Hasta (
    Hasta_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50)
);


CREATE TABLE Muayene (
    Muayene_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Hasta_sutun INT,
    Poliklinik_sutun INT,
    Muayene_Tarihi DATE,
    FOREIGN KEY (Hasta_sutun) REFERENCES Hasta(Hasta_sutun),
    FOREIGN KEY (Poliklinik_sutun) REFERENCES Poliklinik(Poliklinik_sutun)
);


CREATE TABLE Laboratuvar (
    Laboratuvar_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Laboratuvar_Adi VARCHAR(100)
);


CREATE TABLE Tahlil (
    Tahlil_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Tahlil_Adi VARCHAR(100),
    Laboratuvar_sutun INT,
    FOREIGN KEY (Laboratuvar_sutun) REFERENCES Laboratuvar(Laboratuvar_sutun)
);

CREATE TABLE Tahlil_Istek (
    Istek_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Hasta_sutun INT,
    Tahlil_sutun INT,
    Doktor_sutun INT, 
    Istek_Tarihi DATE,
    FOREIGN KEY (Hasta_sutun) REFERENCES Hasta(Hasta_sutun),
    FOREIGN KEY (Tahlil_sutun) REFERENCES Tahlil(Tahlil_sutun),
    FOREIGN KEY (Doktor_sutun) REFERENCES Doktor(Doktor_sutun)
);


CREATE TABLE Servis (
    Servis_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Servis_Adi VARCHAR(100),
    Poliklinik_sutun INT,
    FOREIGN KEY (Poliklinik_sutun) REFERENCES Poliklinik(Poliklinik_sutun)
);


CREATE TABLE Hemsire (
    Hemsire_sutun INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50),
    Servis_sutun INT, 
    FOREIGN KEY (Servis_sutun) REFERENCES Servis(Servis_sutun)
); 