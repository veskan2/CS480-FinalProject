package com.mango.constant;


import org.springframework.stereotype.Component;

@Component
public class WebConstant {

    // Current logged-in user
    public static final String LOGIN_USER = "login_user";

    // Student reservation success status
    public static final String RESERVATION_SUCCESS_STATE = "Reservations Successful";

    // Student reservation canceled status
    public static final String RESERVATION_CANCELED_STATE = "Reservations Cancellation";

    // Student blacklist active status
    public static final String BLACKED_SUCCESS_STATE = "Blacklisted";

    // Student blacklist inactive status
    public static final String BLACKED_CANCELED_STATE = "Inactive";

}
