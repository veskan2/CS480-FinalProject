package com.mango.control;


import com.mango.constant.WebConstant;
import com.mango.pojo.Student;
import com.mango.service.Impl.StudentServiceImpl;
import com.mango.utils.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SettingController {

    @Autowired
    StudentServiceImpl studentService;

    @GetMapping("/personal_settings")
    public String personal_settings(HttpServletRequest request,Model model) {

        Student loginUser = CommonUtil.getLoginUser(request);
        Student student = studentService.getStudentById(loginUser.getS_id());
//        System.out.println(student);
        model.addAttribute("login_user",student);

        return "settings/personal_settings";
    }


    @GetMapping("/updateStudentInfo")
    public String updateStudentInfo(HttpServletRequest request) {
        System.out.println("Update Information");
        Student student = new Student();

//        Inject student numbers
        student.setS_id(CommonUtil.getLoginUser(request).getS_id());

        String s_name = request.getParameter("s_name");
        if (!"".equals(s_name) && s_name != null) {
            student.setS_name(s_name);
        }
//        System.out.println(s_name);

        String s_year = request.getParameter("s_year");
        if (!"".equals(s_year) && s_year != null) {
            student.setS_year(s_year);
        }
//        System.out.println(s_year);

        String s_major = request.getParameter("s_major");
        if (!"".equals(s_major) && s_major != null) {
            student.setS_major(s_major);
        }
//        System.out.println(s_major);


        String s_class = request.getParameter("s_class");
        if (!"".equals(s_class) && s_class != null) {
            student.setS_class(s_class);
        }
//        System.out.println(s_class);


        String s_phone_number = request.getParameter("s_phone_number");
        if (!"".equals(s_phone_number) && s_phone_number != null) {
            student.setS_phone_number(s_phone_number);
        }
//        System.out.println(s_phone_number);

        studentService.updateStudentInfo(student);

        return "redirect:personal_settings";
    }


    /**
     * Change password
     * @param request
     * @param model
     * @return
     */
    @GetMapping("/changePassword")
    public String changePassword(HttpServletRequest request, Model model) {
        // Retrieve the logged-in user
        Student loginUser = CommonUtil.getLoginUser(request);
        Student student = studentService.getStudentById(loginUser.getS_id());

        // Get input parameters from the request
        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("cm_password");

        // Debugging information
        System.out.println("Old Password: " + oldPassword);
        System.out.println("New Password: " + newPassword);

        // Validate the old password
        if (oldPassword == null || oldPassword.isEmpty()) {
            model.addAttribute("msg", "Old password cannot be empty!");
        } else if (!oldPassword.equals(loginUser.getPassword())) {
            model.addAttribute("msg", "Incorrect old password!");
        } else if (newPassword == null || newPassword.isEmpty()) {
            model.addAttribute("msg", "New password cannot be empty!");
        } else if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("msg", "Passwords do not match!");
        } else {
            // Update the password
            System.out.println("Updating password...");
            studentService.updatePassword(loginUser.getS_id(), newPassword);
            System.out.println("Password updated successfully");
            model.addAttribute("msg", "Password updated successfully!");
        }

        // Add the updated user details to the model
        model.addAttribute("login_user", student);
        return "settings/personal_settings";
    }

}
