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
    </head>
    

                <!-- Blank Start -->

                <div class="container-fluid pt-4 px-4">
                    <div
                        class="row bg-light rounded align-items-center justify-content-center mx-0"
                        >
<!--                        <div class="mb-4 px-4 py-3 border-bottom d-flex justify-content-between align-items-center">
                            <h4>Post Manage</h4>
                            <a href="postDetailManage?event=add" class="ms-text-primary font-weight-bold">Add Post</a>
                        </div>-->

                        <div class="col-md-12">
                            <div class="d-flex flex-column align-items-center justify-content-center mt-2">
                                 <form action="postManage">
                                            <div class="container d-flex justify-content-between">
                                                <input type="text" name="postTitle" placeholder="Search Title" class="form-control w-25 mx-3" value="${postTitle}" />
                                                <select class="form-select text-primary w-25 me-3" name="postAuthor" >
                                                    <c:forEach var="a" items="${authorList}">
                                                        <option value="${a.getUserID()}">${a.getFirstName()} ${a.getLastName()} </option>
                                                    </c:forEach>
                                                </select>
                                                <select class="form-select text-primary w-25 me-3" name="postCategory" >
                                                    <c:forEach var="c" items="${categoryList}">
                                                        <option value="${c}">${c} </option>
                                                    </c:forEach>
                                                </select>
                                                <select class="form-select text-primary w-25 me-3" name="sortBy" >
                                                    <c:forEach var="s" items="${sortList}">
                                                        <option value="${s}">${s}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                                </form>
                                <div class="container row mt-5 mb-4">
                                    <div class="col-md-12">
                                        <!-- Services List -->
                                        <table class="table">
                                            <thead class="text-light" style="background: #143763;">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Thumbnail</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Category</th>
                                                    <th scope="col">Brief</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="service-list">
                                                <c:forEach var="l" items="${list}">
                                                    <tr id="${l.getPostID()}" class="service p-3 " ${l.isStatusPost()}>
                                                        <th scope="row">${l.getPostID()}</th>
                                                        <td><img src="${l.getThumbnail()}" alt="ìmg" style="width: 12rem;height: 8rem;object-fit: cover;" /></td>
                                                        <td>${l.getTitle()}</td>
                                                        <td>${l.getCategoryPost()}</td>
                                                        <td>${l.getBriefInfo()} </td>
                                                        <c:if test="${l.isStatusPost()}"><td><p class="status text-success mt-2">Active</p></td></c:if>
                                                        <c:if test="${!l.isStatusPost()}"><td><p class="status text-black-50 mt-2">Inactive</p></td></c:if>
                                                            <td>
                                                                <div class="d-flex h-50 align-content-center flex-wrap" >
                                                                    <div class="d-flex">
                                                                    <c:if test="${l.isStatusPost()}"> <a href="postManage?event=hide&postId=${l.getPostID()}"><button class="button-icon me-2 showhide hide-service-button"><img src="resources/img/icon/hide.png" alt="alt"/></button></a> </c:if>
                                                                    <c:if test="${!l.isStatusPost()}"> <a href="postManage?event=show&postId=${l.getPostID()}"><button class="button-icon me-2 showhide show-service-button"><img src="resources/img/icon/visual.png" alt="alt"/></button> </c:if>
                                                                        <button class="button-icon"><a href="postDetail?event=update&postID=${l.getPostID()}"><img src="resources/img/icon/pen.png" alt="alt"/></a></button>
                                                                </div></div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                       
                                    </div>
                                </div>
                            </div>
                                                <form action="postManage">
                            <div class="d-flex justify-content-center mb-5" id="pagination-container">
                                <c:forEach var="p" begin="1" end="${numOfPage}">
                                    <input class="pagination-btn ms-2 active" type="submit" name="page" value="${p}" /> 
                                </c:forEach>
                            </div>
                            </form>

                        </div>
                       </form>
                    </div>
                </div>

                <!-- Blank End -->

                <!-- Footer Start -->
                <div class="mt-4">
                </div>
                <!-- Footer End -->
            </div>
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
