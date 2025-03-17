StoryScape Library SQL Database


Project Overview

StoryScape Library is a SQL-based database system designed to manage a library's core functionalities, including book inventory, member management, loans, reservations, payments, and more. This project provides a structured schema with multiple tables, relationships, and sample data to simulate a real-world library system.

Features

Member Management: Store member details, including contact information and status.

Book Inventory: Maintain records of books, authors, publishers, and categories.

Loans & Reservations: Track book loans, returns, overdue counts, and reservations.

Orders & Payments: Manage book orders, payments, and shopping cart details.

Reviews & Ratings: Allow members to review and rate books.

Delivery Tracking: Monitor order delivery status.

SQL Queries: Includes various analytical queries to retrieve meaningful insights.

Database Schema

The database consists of the following tables:

Members: Stores member details.

Category: Defines book loan policies and fines.

Publishers: Stores publisher information.

Books: Catalog of books with author, genre, price, and stock details.

BookstoreManager: Records bookstore manager details.

Reviews: Stores book ratings and comments.

OrderTable: Manages book orders.

ShoppingCart: Tracks member purchases.

Payments: Records payment transactions.

Delivery: Stores delivery details of orders.

Loan: Tracks book loans and overdue fines.

Reservation: Manages book reservations.

Sample Data

The project includes preloaded sample data with:

20 Publishers

20 Books

20 Bookstore Managers

20 Members

20 Reviews

20 Orders

20 Shopping Carts

20 Payments

20 Deliveries

20 Loans

20 Reservations

SQL Queries

The project also contains SQL queries for:

Retrieving books available for loan.

Listing active members with borrowed books.

Calculating overdue fines for members.

Identifying the most borrowed book per category.

Determining the most popular book genre.

Counting total book reservations.

Finding publishers with the highest stock of books in a category.

Listing authors with the most books in the library.

Finding members who borrowed books from a specific genre.

Retrieving books priced above a specific value.

Usage

Setup the Database: Execute the CREATE DATABASE StoryScape_Library; command in SQL Server or MySQL.

Create Tables: Run the provided SQL scripts to create tables.

Insert Sample Data: Populate tables with the provided sample data.

Run Queries: Execute the predefined SQL queries for analysis and reporting.
