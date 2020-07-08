package pers.wmx.learningcenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

/**
 * @author: wang ming xin
 * @create: 2019-04-12 21:27
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class TimeTests {

    @Autowired
    BCryptPasswordEncoder encoder;

    @Test
    public void test(){

    }

}
