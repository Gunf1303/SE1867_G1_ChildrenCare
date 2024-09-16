/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import model.User;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class RequestFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest Servletrequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) Servletrequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getServletPath();

        //Admin Function
        if (url.startsWith("/admin")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getName().equals("Admin")) {
                    chain.doFilter(Servletrequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                    return;
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
                return;
            }

        } //Manager Function
        else if (url.startsWith("/manager")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getName().equals("Manager") || u.getRole().getName().equals("Admin")) {
                    chain.doFilter(Servletrequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                    return;
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
                return;
            }
        } //Staff Function
        else if (url.startsWith("/staff")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getName().equals("Manager") || u.getRole().getName().equals("Admin") || u.getRole().getName().equals("Staff")) {
                    chain.doFilter(Servletrequest, servletResponse);
                    return;
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                    return;
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
                return;
            }
        } //Customer Function
        else if (url.startsWith("/customer")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getName().equals("Manager") || u.getRole().getName().equals("Admin") || u.getRole().getName().equals("Staff") || u.getRole().getName().equals("Customer")) {
                    chain.doFilter(Servletrequest, servletResponse);
                    return;
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                    return;
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
                return;
            }
        } 
        //Public Function
        else {
            chain.doFilter(Servletrequest, servletResponse);
            return;
        }
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
