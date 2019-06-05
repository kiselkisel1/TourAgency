package net.agency.service;


public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}