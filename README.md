# Serviqo_Service_Booking_Platform

## Project Name : Serviqo

---

### Team Members

| Roll Number |      Name           |        Email                     |            Role           |
|-------------|---------------------|----------------------------------|---------------------------|
| 20230104052 | Abonty Rahman       | abonty.cse.20230104052@aust.edu  | Lead                      |
| 20230104059 | Zahin Zia Heya      | zahin.cse.20230104059@aust.edu   | Backend Developer         |
| 20230104065 | Nusrat Jahan Tuli   | nusrat.cse.20230104065@aust.edu  | Frontend Developer        |  

---

### Project Overview

#### Objective  
*Serviqo* is a web-based *home-service booking platform* designed to connect users with verified service providers based on their location.
The system allows customers to easily book services such as cleaning, appliance repair, maintenance, and makeover services from trusted professionals in their area.
By incorporating location-based matching, the platform aims to provide a reliable, transparent, and efficient service marketplace.
The primary goal of this project is to simplify service discovery, reduce manual coordination, and enhance trust between users and service providers.

#### Target Audience  
- Homeowners and tenants seeking reliable on-demand home services
- Urban residents preferring location-based, verified service providers
---

### Tech Stack

#### Backend  
- *Laravel*
 
#### Frontend  
- *React.js*
- *Tailwind CSS/Bootstrap*  

#### Database
- *MySQL database*
  
#### Rendering Method  
- *Client-Side Rendering (CSR)*

---

### UI Design

#### Mock UI
- The user interface mockups have been carefully crafted using *Figma* to ensure a *clean, intuitive, and user-friendly* design.

🔗 *Figma Design Link :* https://www.figma.com/make/8v1crvVvxtjaXvBHZh8oKI/Serviqo--Home-Service-Booking-Website?t=g3lNvGhvOhdFbenX-1

---

### Project Features

#### Core Features
- *Location-based service discovery* allowing users to find services in their selected area
- *Secure authentication* for users and admins
- *Multi-category* home service marketplace covering cleaning, repair, maintenance, and makeover services
- *Service scheduling and booking* system with date and time selection

#### Advanced Features
- *Rating and review mechanism* to build user trust and accountability
- *Notification system* for booking updates and confirmations

#### Authentication
- *JWT-based secure authentication* for session management  
- *Role-based login* for customers, service providers, and administrators 

#### CRUD Operations
- User Management: Create, view, update, and delete user profiles
- Service Listings: Full CRUD operations for services and pricing
- Bookings: Create, view, update, cancel, and track service orders
- Reviews & Ratings: Create, view, and update feedback

---

### Key API Endpoints (Approx.)
- POST /auth/register – Customer registration
- POST /auth/login – Login for all user roles
- GET /customers/orders – View customer service orders
- POST /customers/orders – Create a new service order
- GET /customers/order-history – Fetch past service records
- PUT /admin/orders/{id}/schedule – Admin schedules service orders
- POST /admin/providers – Add and verify service providers

---

### Milestones

#### Milestone 1: Setup & Authentication
- Laravel and React project initialization
- Database schema design
- JWT authentication implementation
- Role-based access control
- Basic UI layout setup

#### Milestone 2: Core Booking System
- Service category and listing management
- Location-based filtering and search
- Booking and scheduling system
- User dashboard
- Frontend

#### Milestone 3: Finalization & Enhancements
- Rating and review system
- Order tracking and notifications
- UI/UX improvements
- Testing and deployment

---

### Future Goals

#### Mobile Application Development
- Develop native Android and iOS applications to provide a more seamless and accessible booking experience for users and service providers.

#### AI-Based Service Recommendation System
- Implement intelligent recommendation algorithms to suggest services and providers based on user preferences, booking history, and location.

#### Dynamic Pricing & Offers
- Introduce demand-based pricing, promotional discounts, and subscription plans for frequent users.

#### Real-Time Provider Tracking
- Enable live tracking of service providers for improved transparency and user confidence.

#### Multi-City and Regional Expansion
- Scale the platform to support multiple cities and regions with localized service availability and pricing.

#### Advanced Analytics Dashboard
- Provide service providers and administrators with detailed analytics on bookings, earnings, customer behavior, and performance metrics.

#### In-App Chat and Support System
- Enhance communication with real-time chat support and automated assistance for issue resolution.

#### Third-Party Integrations
- Integrate with external services such as payment gateways, mapping APIs, and CRM tools to improve functionality and scalability.

#### Enhanced Security & Fraud Detection
- Strengthen platform security through anomaly detection, audit logs, and automated fraud prevention mechanisms.

---

### Conclusion
*Serviqo* addresses the challenges associated with discovering, booking, and managing reliable home services by providing a centralized, location-based digital platform. Through secure authentication and verified service providers, the system ensures trust, transparency, and efficiency for both customers and service professionals.
