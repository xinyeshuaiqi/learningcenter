package pers.wmx.learningcenter.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import pers.wmx.learningcenter.web.SessionInterceptor;

/**
 * @author: wang ming xin
 * @create: 2019-04-12 10:55
 */

@Configuration
public class SessionConfiguration implements WebMvcConfigurer {

   @Autowired
   SessionInterceptor sessionInterceptor;

   /*
   *  注册拦截器
   * */
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
       registry
               .addInterceptor(sessionInterceptor)
               .addPathPatterns("/**")
               .excludePathPatterns("/")
               .excludePathPatterns("/login")
               .excludePathPatterns("/toLogin")
               .excludePathPatterns("/registry")
               .excludePathPatterns("/toRegistry")
               .excludePathPatterns("/css/**")
               .excludePathPatterns("/js/**")
               .excludePathPatterns("/images/**");
   }
}
