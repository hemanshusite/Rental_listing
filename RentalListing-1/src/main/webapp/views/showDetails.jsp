<%@page import="com.rentlist.web.model.User"%>
<%@page import="com.rentlist.web.model.add_Property"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html lang="en">
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("/views/login.jsp");
}
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hemstar - showDetails</title>
    <link rel="stylesheet" href="/views/css/showDetails.css">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body>
<a href="/propertyview" class="fa fa-arrow-left previous"></a>&nbsp;&nbsp;&nbsp;<i class="my-name"></i>
<%
add_Property prop = (add_Property) request.getAttribute("showDetails");
if (prop != null) {
%>
    <div class="card-wrapper">
        <div class="card">
            <!-- card left -->
            <div class="product-imgs">
                <div class="img-display">
                    <div class="img-showcase">
                        <img src="data:image/*;base64,<%=prop.getImgBase64() %>"
                            alt="shoe image">
                    </div>
                </div>
            </div>
            <!-- card right -->
            <div class="product-content">
                <h2 class="product-title"><%= prop.getTitle() %></h2>
                <a href="#" class="product-link">Owner name: <%= prop.getName() %></a>

                <div class="product-price">
                    <p class="new-price">Price: <span><%= prop.getPrice() %></span></p>
                </div>

                <div class="product-detail">
                    <h2>Description: </h2>
                    <p><%= prop.getDescription() %></p>
                    <h2>Address: </h2>
                    <p><%= prop.getAddress() %></p>
                    <ul>
                        <li>Property For: <span style="text-transform:uppercase;"><%= prop.getProp_type() %></span></li>
                        <li>Property Size: <span><%= prop.getChoice() %></span></li>
                        <li>Phone: <span><%= prop.getPhone() %></span></li>
                        <li>Email: <span><%= prop.getEmail() %></span></li>
                    </ul>
                </div>

<!--                 <div class="purchase-info">
                    <a class="" style="text-decoration: none;color:black" id="showAlertButton" ><button type="button" class="btn" id="myButton">
                        Get Property
                    </button></a> 
                </div>  -->
            </div>
        </div>
    </div>
<%
}
%>
    <script>
        const imgs = document.querySelectorAll('.img-select a');
        const imgBtns = [...imgs];
        let imgId = 1;

        imgBtns.forEach((imgItem) => {
            imgItem.addEventListener('click', (event) => {
                event.preventDefault();
                imgId = imgItem.dataset.id;
                slideImage();
            });
        });

        function slideImage() {
            const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;

            document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
        }

        window.addEventListener('resize', slideImage);
        
        /* document.addEventListener("DOMContentLoaded", function() {
            // Get the button element
            var button = document.getElementById("showAlertButton");

            // Add a click event listener to the button
            button.addEventListener("click", function() {
              // Show SweetAlert
              Swal.fire({
                title: 'Hello!',
                text: 'This is a SweetAlert!',
                icon: 'success',
                confirmButtonText: 'Cool'
              }).then(() => {
                  // Change the text of the button permanently
                  document.getElementById('myButton').innerText = 'Text Changed!';
                  document.getElementById('myButton').style.backgroundColor="green";
                });
              
            });
          }); */
          
          const buttonText = localStorage.getItem('buttonText');

          // Set initial text of the button
          document.getElementById('myButton').innerText = buttonText || 'Get Property';

          function changeText() {
            // Show SweetAlert
            Swal.fire({
              title: 'Hello!',
              text: 'Text will be changed permanently!',
              icon: 'success',
              confirmButtonText: 'OK'
            }).then(() => {
              // Change the text of the button permanently
              document.getElementById('myButton').innerText = 'Text Changed!';
              document.getElementById('myButton').innerText = 'Text Changed!';

              // Save the changed text in local storage
              localStorage.setItem('buttonText', 'Text Changed!');
            });
          }
    </script>
</body>

</html>