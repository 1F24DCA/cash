package kr.co.gdu.cash;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class CashApplication {
	// 배포 환경의 경로: "/home/ubuntu/tomcat9/webapps/ROOT/cash-upload/"
	// 개발 환경의 경로: "D:\\Development\\workspace\\spring-tool-suite\\cash\\src\\main\\resources\\static\\upload\\"
	public static final String UPLOAD_PATH = "D:\\Development\\workspace\\spring-tool-suite\\cash\\src\\main\\resources\\static\\upload\\";
	
	public static void main(String[] args) {
		SpringApplication.run(CashApplication.class, args);
	}
}
