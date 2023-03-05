package com.grzzlyb.movietracker.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	private DataSource securityDataSource;
	
	@Autowired
	public SecurityConfig(DataSource securityDataSource) {
		this.securityDataSource = securityDataSource;
	}
	
	@Bean
	public UserDetailsManager userDetailsManager() {
		return new JdbcUserDetailsManager(securityDataSource);
	}
	
	@Bean
	public SecurityFilterChain filterchain(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
					.antMatchers("/movie/showForm*").hasRole("ADMIN")
					.antMatchers("/movie/save*").hasRole("ADMIN")
					.antMatchers("/movie/delete").hasRole("ADMIN")
					.antMatchers("/movie/**").hasRole("USER")
					.antMatchers("/resources/**").permitAll()
					.and()
					.formLogin()
						.loginPage("/showLogin")
						.loginProcessingUrl("/authenticateTheUser")
						.permitAll()
					.and()
					.logout().permitAll()
					.and()
					.exceptionHandling().accessDeniedPage("/access-denied");
		
		return http.build();
	}
}
