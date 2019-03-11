package com.zentry.Configuration;

import com.zentry.Controllers.HomeController;
import com.google.common.cache.CacheBuilder;
import com.zentry.DAO.NewsDAO;
import com.zentry.tools.FileSaver;
import com.zentry.tools.Uploader;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.guava.GuavaCacheManager;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.concurrent.TimeUnit;

@EnableWebMvc
@ComponentScan(basePackageClasses = {HomeController.class, NewsDAO.class, Uploader.class, FileSaver.class})
@EnableCaching
public class AppWebConfiguration extends WebMvcConfigurerAdapter {

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");

        // resolver.setExposeContextBeansAsAttributes(true);
        resolver.setExposedContextBeanNames("carrinhoCompras");

        return resolver;
    }

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("/WEB-INF/messages");
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setCacheSeconds(1);
        return messageSource;
    }

    @Bean
    public FormattingConversionService mvcConversionService() {
        DefaultFormattingConversionService conversionService = new DefaultFormattingConversionService();
        DateFormatterRegistrar registrar = new DateFormatterRegistrar();
        registrar.setFormatter(new DateFormatter("dd/MM/yyyy hh:mm aa"));
        registrar.registerFormatters(conversionService);

        return conversionService;
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Bean
    public CacheManager cacheManager() {
        CacheBuilder<Object, Object> builder = CacheBuilder.newBuilder().maximumSize(100).expireAfterAccess(5,
                TimeUnit.MINUTES);
        GuavaCacheManager manager = new GuavaCacheManager();
        manager.setCacheBuilder(builder);
        return manager; //new ConcurrentMapCacheManager();
    }

    //JSON

//    @Bean
//    public ViewResolver contentNegotiationViewResolver(ContentNegotiationManager manager) {
//        List<ViewResolver> viewResolvers = new ArrayList<>();
//        viewResolvers.add(internalResourceViewResolver());
//        viewResolvers.add(new JsonViewResolver());
//
//        ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
//        resolver.setViewResolvers(viewResolvers);
//        resolver.setContentNegotiationManager(manager);
//        return resolver;
//    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LocaleChangeInterceptor());
    }

    @Bean
    public LocaleResolver localeResolver() {
        return new CookieLocaleResolver();
    }
}
