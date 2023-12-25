package dev.sunny.javaeedemo;


import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Named;

@Named(value = "loginBean")
@ApplicationScoped
public class LoginBean {
    private String userName;
    private String password;
    private String errorMsg;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public boolean isValidUser() {
        return "admin".equalsIgnoreCase(this.userName) && "admin".equalsIgnoreCase(this.password);
    }

    public String validate() {
        if (isValidUser()) {
            errorMsg = null;
            return "welcome";
        } else {
            errorMsg = "Invalid user id or password! Please try again.";
            return null;
        }
    }
}
