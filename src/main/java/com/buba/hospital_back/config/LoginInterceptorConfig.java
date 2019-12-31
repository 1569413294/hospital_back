package com.buba.hospital_back.config;




import com.buba.hospital_back.filter.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.Validator;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.*;

import java.util.List;


@Configuration
public  class LoginInterceptorConfig  implements WebMvcConfigurer {
    //通过手动javaConfig的方式显示注入bean
    @Bean  //返回值是拦截器类型
    public LoginInterceptor createLoginInterceptor() {
        return new LoginInterceptor();
    }


    //增加拦截器方法
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration addInterceptor = registry.addInterceptor(createLoginInterceptor());
        //接受所有的访问
        addInterceptor.addPathPatterns("/**").excludePathPatterns("/user/getPhoneMsg","/user/doVirifyMessage","/user/login","/user/loginOut","/user/auto_login");
        /* addInterceptor.excludePathPatterns("/defaultKaptcha");
        addInterceptor.excludePathPatterns("/validateDefaultKaptcha");*/
        //addInterceptor.excludePathPatterns("/js/**/*.js");
        //addInterceptor.excludePathPatterns("/css/**/*.css");

    }



    @Override
    public void configurePathMatch(PathMatchConfigurer pathMatchConfigurer) {

    }

    @Override
    public void configureContentNegotiation(ContentNegotiationConfigurer contentNegotiationConfigurer) {

    }

    @Override
    public void configureAsyncSupport(AsyncSupportConfigurer asyncSupportConfigurer) {

    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer defaultServletHandlerConfigurer) {

    }

    @Override
    public void addFormatters(FormatterRegistry formatterRegistry) {

    }
  /*  //添加拦截器
    public void addInterceptors(InterceptorRegistry registry) {

        //拦截路径
        registry.addInterceptor(getMyInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/user/getPhoneMsg","/user/doVirifyMessage");



    }*/




    //访问静态资源

    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }

    //跨域设置

    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**").allowedMethods("*").allowedOrigins("*").allowedMethods("*");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry viewControllerRegistry) {

    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry viewResolverRegistry) {

    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> list) {

    }

    @Override
    public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> list) {

    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> list) {

    }

    @Override
    public void extendMessageConverters(List<HttpMessageConverter<?>> list) {

    }

    @Override
    public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> list) {

    }

    @Override
    public void extendHandlerExceptionResolvers(List<HandlerExceptionResolver> list) {

    }

    @Override
    public Validator getValidator() {
        return null;
    }

    @Override
    public MessageCodesResolver getMessageCodesResolver() {
        return null;
    }

}





















