<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="./resources/css/post-style.css">
        <title>ChildrenCare</title>
    </head>
    <body>
        <!-- Blog Start -->
        <div class="container py-5" id="blog-list">
            <div class="row g-5" >
                <div class="col-lg-8">
                    <!-- Blog Detail Start -->
                    <h1></h1>
                    <div class="mb-5">
                        <img class="img-fluid w-100 rounded mb-5" src="${s.thumbnail}" alt="thumbnail">
                        <h1 class="mb-4">${s.title}</h1>
                        <h2></h2>
                        <p>
                            ${s.title}
                        </p>
                        <div class="d-flex justify-content-between bg-light rounded p-4 mt-4 mb-4">
                            <div class="d-flex align-items-center">
                            </div>
                            <div class="d-flex align-items-center">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sidebar Start -->
                <div class="col-lg-4">
                    <!-- Category Start -->
                    <div class="mb-5">
                        <form action="blog">
                            <input id="post-title" type="text" name="postTitle" placeholder="Search" class="form-select text-primary mt-3 search"/>
                            <select class="form-select text-primary mt-3" name="postCategory">
                                <option selected value="">Services Category</option>
                                <c:forEach var="i" items="${listCate}">
                                    <option value="${i.categoryID}">${i.categoryName}</option>
                                </c:forEach>
                            </select>
                        </form>
                        <!--                        <br>
                                                <a href="service?event=to-contact-link" class="mt-3 ms-2">Contact Us</a>-->
                    </div>
                    <!-- Category End -->
                </div>
                <!-- Sidebar End -->
            </div>
        </div>
        <!-- Blog End -->
    </body>
</html>

