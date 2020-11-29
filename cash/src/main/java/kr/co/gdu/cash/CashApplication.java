package kr.co.gdu.cash;

import javax.servlet.http.HttpServletRequest;

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
	
	// TODO 다른 방법으로 FilePath를 구하는 방법을 강구할 것! 너무 지저분해보임
	public static String getFilePath(HttpServletRequest request) {
		String filePath = CashApplication.UPLOAD_PATH.replaceAll("\\\\", "/");
		filePath = filePath.replaceAll("^.+ROOT(.+)$", "$1");
		filePath = filePath.replaceAll("^.+static(.+)$", request.getContextPath()+"$1");
		
		return filePath;
	}
}
