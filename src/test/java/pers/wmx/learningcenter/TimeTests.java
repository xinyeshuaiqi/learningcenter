package pers.wmx.learningcenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

/**
 * @author: wang ming xin
 * @create: 2019-04-12 21:27
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class TimeTests {

    @Test
    public void test(){
        System.out.println(new Date());
    }
}
