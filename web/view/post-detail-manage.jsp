<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : post-list-manage
    Created on : Sep 26, 2023, 11:11:37 AM
    Author     : quanh
--%>
<%@page import = "model.*" %>
<%@page import = "dao.*" %>
<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>ChildrenCare</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="keywords" />
        <meta content="" name="description" />

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon" />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
            rel="stylesheet"
            />

        <!-- Icon Font Stylesheet -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet"
            />

        <!-- Libraries Stylesheet -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="./resources/css/staff-dashboard.css">
        <link rel="stylesheet" href="./resources/css/services-style.css">
        <link rel="stylesheet" href="./resources/css/post-style.css">
    </head>
    <body>
                <!-- Blog Start -->
                <div class="container py-5" id="blog-list">
                    <div class="row g-5" >
                        <div class="col-lg-12">
                            <!-- Blog Detail Start -->
                            <form action="postDetail" method="Post">

                                <div class="mb-5">
                                    
                                    <img class="img-fluid w-25 rounded mb-5" src="${post.getThumbnail()}" alt="thumbnail">
                                    <div class="form-group mt-3">
                                        <label for="Thumbnail">Post Thumbnail:</label>
                                        <input type="text" class="form-control" id="Thumbnail" name="Thumbnail" value="${post.getThumbnail()}">
                                    </div>
                                    <div>
                                         <div class="d-flex justify-content-between bg-light rounded p-4 mt-4 mb-4">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-2 avatar" src="${avatar}" alt="">
                                            <span>${author}</span>
                                        </div>
                                    </div>
                                        <div class="d-flex align-items-baseline">
                                            <input type="hidden" class="form-control text-muted" type="text" name="postID" value="${post.getPostID()}" readonly  />
                                        </div>
                                        <div class="d-flex align-items-baseline">
                                            <p class="text-muted me-2">Title: </p>
                                            <input class="form-control" type="text" name="Title" value="${post.getTitle()}"  />

                                        </div>
                                        <c:if test="${! empty errorMessage1}">
                                            <h5  class="text-danger text-start fw-bold">${errorMessage1}</h5>
                                        </c:if>
                                        <div>
                                            <p class="text-muted">Brief: </p>
                                            <textarea class="form-control text-muted" rows="4" cols="50" name="Brief" value="${post.getBriefInfo()}">${post.getBriefInfo()}</textarea>
                                        </div>
                                        <c:if test="${! empty errorMessage2}">
                                            <h5  class="text-danger text-start fw-bold">${errorMessage2}</h5>
                                        </c:if>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <p class="text-muted">Status: </p>
                                            <c:if test="${post.isStatusPost()}">

                                                <select class="form-select text-primary mt-3 mb-4 w-75" name="status" >
                                                    <option value="true" selected>Active</option>
                                                    <option value="false">Inactive</option>
                                                </select>
                                            </c:if>
                                            <c:if test="${!post.isStatusPost()}">

                                                <select class="form-select text-primary mt-3 mb-4 w-75" name="status" >
                                                    <option value="false">Inactive</option>
                                                    <option value="true" selected>Active</option>
                                                </select>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="text-muted">Category: </p>
                                            <select class="form-select text-primary mt-3 mb-4 w-75" name="postCategory"  class="form-select">
                                                <c:forEach var="c" items="${categoryList}">
                                                    <option value="${c}">${c}</option>
                                                </c:forEach>
                                            </select>
                                        </div>   
                                    </div>
                                    <div>
                                        <p class="text-muted">Content: </p>
                                        <textarea class="form-control text-muted" rows="6" cols="50" value="${post.getContent()}" name="Content">${post.getContent()}</textarea>
                                    </div>
                                    <c:if test="${! empty errorMessage2}">
                                        <h5  class="text-danger text-start fw-bold">${errorMessage3}</h5>
                                    </c:if>

                                    <div class="d-flex justify-content-center">
                                        <input hidden="" name="event" value="${event}">
                                        <input class="btn btn-primary mt-3 w-25" type="submit" value="${event}" name="event" />
                                    </div>
                                </div>
                            </form>
                            <!-- Blog Detail End -->
                        </div>
                    </div>
                </div>

                <!-- Footer Start -->
                <div class="mt-4">
                </div>
                <!-- Footer End -->
            <!-- Content End -->

        </div>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"
        ></script>

        <!-- Template Javascript -->
        <script>
            document.querySelector('.sidebar-toggler').addEventListener('click', function () {
                var sidebar = document.querySelector('.sidebar');
                var content = document.querySelector('.content');

                sidebar.classList.toggle('open');
                content.classList.toggle('open');

                return false;
            });
        </script>

    </body>
</html>


