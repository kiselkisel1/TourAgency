package net.agency.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
      "file:src/main/webapp/WEB-INF/appconfig-root.xml"
       , "file:src/main/webapp/WEB-INF/appconfig-data.xml"
        ,"file:src/main/webapp/WEB-INF/appconfig-mvc.xml"
})
 @WebAppConfiguration
public class ResortControllerTest {

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mvc;

    @BeforeEach
    public void setUp() {
        mvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext).build();
    }

    @Test
    public void checkResortList() throws Exception {
         this.mvc.perform(get("/resort/add"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("adding/add-resort"));
    }

    @Test
    public void deleteResortById() throws Exception {
        this.mvc.perform(get("/resort/delete").param("idResort", "1"))
                .andDo(print())
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/resort/list"));
    }


}
