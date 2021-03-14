package org.zerock.sample;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jdk.internal.jline.internal.Log;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleTests {
	
	
	@Autowired
	private Restaurant restaurant;
	
	@Test
	public void testExist() {
		//null 이 아니어야만 실행
		assertNotNull(restaurant);
		
		log.info(restaurant);
		log.info("==================");
		log.info("안녕");
		log.info(restaurant.getChef());
		
	}
	

	
	
	
}












