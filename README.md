# Retail & Resell Pricing Portfolio

A portfolio project showcasing a **retail & resell platform** built with **React (frontend)** and **Django + MySQL (backend)**.  
The system demonstrates **separate modules for Admin, Users, and Dealers** with product management, enquiry flow, and advanced filtering options.  

⚠️ **Note:** This is a portfolio/demo project.  
There is **no authentication or login process** — all pages are accessible without credentials.

---
## 🛠️ Tech Stack

<p align="center">
  <!-- Frontend -->
  <img src="https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB" />

  <!-- Backend -->
  <img src="https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=green" />
  <img src="https://img.shields.io/badge/DRF-092E20?style=for-the-badge&logo=django&logoColor=white" />

  <!-- Database -->
  <img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white" />

  <!-- Communication -->
  <img src="https://img.shields.io/badge/API-FF6C37?style=for-the-badge&logo=postman&logoColor=white" />
</p>


---
## 📸 Screenshots
`Admin-Dashboard`,
![Screenshot_17-9-2025_16229_localhost](https://github.com/user-attachments/assets/1737692d-9e52-4273-b064-158c09a80c85)

![Screenshot_17-9-2025_16248_localhost](https://github.com/user-attachments/assets/ef5bb9c6-e907-4916-af77-a63e4262cee2)

**Admin-Side - Receive mail**  
<img src="https://github.com/user-attachments/assets/cc5fdb19-2b4b-46de-b070-80db9785875c" alt="Admin Screenshot" width="350" />


`User-Side`,
`1.vist product` ,
![Screenshot_17-9-2025_155718_localhost](https://github.com/user-attachments/assets/87e09c67-ab6b-4b19-845f-67eacfc476b0)

`2.sigle product with enquire`,
![Screenshot_17-9-2025_15582_localhost](https://github.com/user-attachments/assets/6636c912-9ed2-4e3c-ac0f-9a12b4168a94)

`3.comapre product page `,
![Screenshot_17-9-2025_16124_localhost](https://github.com/user-attachments/assets/cc058915-34c1-45bf-9be7-9f28230d3897)

`4.single category product`,
![Screenshot_17-9-2025_155843_localhost](https://github.com/user-attachments/assets/0cb39e01-1a48-41b0-bb44-e9714ecfe7f5)

`Dealer-Side`
![Screenshot_17-9-2025_16549_localhost](https://github.com/user-attachments/assets/0e177324-6a6c-4041-ae5f-cf740ccccc84)

![Screenshot_17-9-2025_16612_localhost](https://github.com/user-attachments/assets/cef06a5a-289a-43e9-8299-0179d951443f)

**Dealer-Side - Receive mail**  
<img src="https://github.com/user-attachments/assets/2ea7750b-8771-4ad1-adf8-d40d2cb49aa1" alt="screenshot" width="350" />




---

## 🚀 Features

### 🔑 Admin Side
- Admin dashboard  
- Manage products & categories  
- Receive dealer enquiries via email  

### 👤 User Side
- View all products  
- Single product page with **enquiry option**  
- Compare products  
- Browse products by category  
- Advanced filtering: **color, category, type, size, price (low → high / high → low)**  

### 🏬 Dealer Side
- Add multiple products  
- Submit all products via **enquiry format**  
- Enquiries automatically sent to both **admin & dealer via email**  
- Generate unlimited dealer-specific product links  
 

---

## ⚡ Project Setup

This repository contains **two main directories**:

1. **`frontend/`** → React application (runs on your system IP, e.g. `http://192.168.29.61:8000`)  
2. **`merge/`** → Django backend (default port: `http://127.0.0.1:8000` or system IP)

---


🎯 Future Enhancements

1.Add authentication (Admin, Dealer, User roles)
2.Payment gateway integration
3.Dealer dashboard with analytics
4.Multi-language support

📌 Disclaimer:

This project is created only for portfolio purposes.
It demonstrates technical skills in React, Django, and MySQL but does not include authentication, security hardening, or production deployment features.


### 1️⃣ Backend Setup (merge/)
```bash
cd merge
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver



