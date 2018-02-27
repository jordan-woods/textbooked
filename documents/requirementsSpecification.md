# 5.0 Requirements Specification

## 5.1 Introduction to TextBooked
TextBooked is a student to student textbook buying and selling application. For the first version, the application will be specific to Loyola Marymount University students. LMU students will be able to post a book that they are selling with information such as condition, teacher, class, and price. Other students will be able to go to the application and view all books that are being sold as well as search for books that they would like to purchase. Once they have found a book they would like to purchase, they can tell the original poster that they are interested and the two can meet up on campus to do the exchange. The application will be built using Swift and iOS. The remainder of this document is structured as follows:

**5.2** Functional Requirements  
**5.3** Performance Requirements  
**5.4** Environment Requirements  

**UML Diagram**  
![System Diagram](https://raw.githubusercontent.com/jordan-woods/textbooked/master/documents/uml.png)  

## 5.2 Functional Requirements  
**5.2.1** Model  
&nbsp;&nbsp;**5.2.1.1** The model shall hold all of the user information.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.1.1** User information shall contain user name.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.1.2** User information shall contain user email.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.1.3** User information shall contain user Facebook ID.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.1.4** User information shall contain user book entries.  
&nbsp;&nbsp;**5.2.1.2** The model shall hold all of the books for sale.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.2.1** Books for sale shall contain book name.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.2.2** Books for sale shall contain book author.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.2.3** Books for sale shall contain book publishing information.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.2.4** Books for sale shall contain book condition.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.1.2.5** Books for sale shall contain book price.  

**5.2.2** View  
&nbsp;&nbsp;**5.2.2.1** The view shall begin on a login/create account page.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.1.1** The login/create account page shall have an option to login with Facebook.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.1.1** The login/create account page shall have an option to login with email.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.1.1** The login/create account page shall have a login button.  
&nbsp;&nbsp;**5.2.2.2** The view shall show books for sale upon login.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.2.1** The page showing books for sale shall have a clickable block for each book.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.2.1.1** Each book block shall contain: book title, book author, condition, seller, and price.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.2.2** The page showing books for sale shall have a search bar for searching for specific books.  
&nbsp;&nbsp;**5.2.2.3** The view shall link to a page for book entry.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.3.1** The page for book entry shall contain a manual entry form of book information.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.3.2** The page for book entry shall contain a "Post" button.  
&nbsp;&nbsp;**5.2.2.4** The view shall have a side link for user information.  
&nbsp;&nbsp;&nbsp;&nbsp;**5.2.2.4.1** The side link for user information shall contain the following options: "My Booklist", "Current Bids", "Transaction History", "Get Help", and "Settings".  

**5.2.3** Controller  
&nbsp;&nbsp;**5.2.3.1** The controller shall receive information from the model and serve it to the view.  

## 5.3 Performance Requirements  
**5.3.1** Search Results Return Time  
&nbsp;&nbsp;**5.3.1.1** The application shall return search results based on a user-inputted value within 3 seconds. This assumes standard wifi connection from the user's end.  
**5.3.2** Post Return Time  
&nbsp;&nbsp;**5.3.2.1** The application shall return to the homepage within 3 seconds of clicking "Post" after inputting information for a book. This assumes standard wifi connection from the user's end.  
**5.3.3** Load Books Return Time  
&nbsp;&nbsp;**5.3.3.1** The application shall load book results within 3 seconds of landing on the homepage. This assumes standard wifi connection from the user's end.  

## 5.4 Environment Requirements
The following are the hardware requirements for TextBooked:  
* iPhone 4 or later  

The following are the software requirements for TextBooked:  
* iOS 4 or later  

I will be using Swift 4, Xcode 9, and iOS 11 to develop TextBooked.  
