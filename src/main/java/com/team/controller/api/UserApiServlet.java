package com.team.controller.api;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.team.common.JsonUtil;
import com.team.dto.response.ApiResponse;
import com.team.dto.user.UserRegisterDTO;
import com.team.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.team.common.ServletResponseUtil.sendJsonResponse;

@WebServlet("/api/users/*")
public class UserApiServlet {


}
