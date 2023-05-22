package com.surup.board;

import com.surup.board.dao.BoardDao;
import com.surup.board.dao.UserDao;
import com.surup.board.domain.BoardDto;
import com.surup.board.domain.PageHandler;
import com.surup.board.domain.SearchCondition;
import com.surup.board.domain.UserDto;
import com.surup.board.service.BoardService;
import com.surup.board.service.UserService;
import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import javax.sql.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MyBatisTest {
    @Autowired
    DataSource ds; // 컨테이너로부터 자동 주입받는다.

    @Autowired
    UserDao userDao;

    @Autowired
    BoardDao boardDao;

    @Autowired
    UserService userService;

    @Autowired
    BoardService boardService;

    @Test
    public void jdbcConnectionTest() throws Exception {
//        ApplicationContext ac = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/**/root-context.xml");
//        DataSource ds = ac.getBean(DataSource.class);

        Connection conn = ds.getConnection(); // 데이터베이스의 연결을 얻는다.

        System.out.println("conn = " + conn);
        assertTrue(conn != null);
    }

    @Test
    public void addBoardContents() throws Exception {
        for (int i = 0; i < 579; i++) {
            BoardDto boardDto = new BoardDto("title" + (i + 1), "컨텐츠", "우당탕탕1", "free");
            boardService.registerBoard(boardDto);
        }
    }

    @Test
    public void boardAll() throws Exception {
        List<BoardDto> list = null;
        list = boardService.getBoardAll();
        ListIterator<BoardDto> listIterator = list.listIterator();
        while (listIterator.hasNext()) {
            System.out.println("listIterator = " + listIterator.next());
        }
    }

    @Test // 모든 사용자 검색
    public void UserTest() throws Exception {
        List<UserDto> userDto = userDao.selectAll();
        System.out.println(userDto);
    }

    @Test // birth 데이터 변환 후 DB에 데이터 저장 및 출력
    public void UserTest2() throws Exception {
        userDao.deleteAll();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd");
        StringBuffer stringBuffer = new StringBuffer("230516");
        stringBuffer.insert(2, "-");
        stringBuffer.insert(5, "-");
        Date birth = dateFormat.parse(stringBuffer.toString());
        System.out.println("birth = " + birth);
        UserDto userDto = new UserDto("test123", "test1245@!", "전개발", '남', 230516, "test@gmail.com", "우당탕탕", LocalDate.now());
        int ins_cnt = userService.registerUser(userDto);
        UserDto userDto2 = userService.getUser("test123");
        assertTrue(userService.getUser("test123") != null);
        assertTrue(ins_cnt == 1);

        // mysql date 형식 변환
        SimpleDateFormat receiveFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd", Locale.ENGLISH);
        Date data = receiveFormat.parse(userDto2.getBirth().toString());
        System.out.println("data = " + data);
        String birth2 = transFormat.format(data);
        System.out.println("birth = " + birth2);
    }

    @Test // 동일한 id가 있는지 확인
    public void UserTest3() throws Exception {
        userDao.deleteAll();
        UserDto userDto = new UserDto("test123", "test1245@!", "전개발", '남', 230516, "test@gmail.com", "우당탕탕", LocalDate.now());
        int ins_cnt = userService.registerUser(userDto);
        UserDto selectIdDto = userDao.selectId("test123");
        assertTrue(ins_cnt == 1);
        assertTrue(selectIdDto != null);
    }

    @Test // 동일한 nickname이 있는지 확인
    public void UserTest4() throws Exception {
        userDao.deleteAll();
        UserDto userDto = new UserDto("test123", "test1245@!", "전개발", '남', 230516, "test@gmail.com", "우당탕탕", LocalDate.now());
        int ins_cnt = userService.registerUser(userDto);
        UserDto selectIdDto = userDao.selectNickname("우당탕탕");
        assertTrue(ins_cnt == 1);
        assertTrue(selectIdDto != null);
    }

    @Test // 로그인 체크
    public void UserTest5() throws Exception {
        userDao.deleteAll();
        UserDto userDto = new UserDto("test123", "test1245@!", "전개발", '남', 230516, "test@gmail.com", "우당탕탕", LocalDate.now());
        int ins_cnt = userService.registerUser(userDto);

        UserDto loginCheckUserDto = userService.getUser("test123");
        System.out.println("loginCheckUserDto = " + loginCheckUserDto);

        assertTrue(ins_cnt == 1);
        assertTrue(loginCheckUserDto.getId().equals("test123") && loginCheckUserDto.getPwd().equals("test1245@!"));
    }

    @Test // 모든 사용자 검색
    public void UserTest6() throws Exception {
        List<UserDto> userDto = userService.getUserAll();
        System.out.println(userDto);
    }

    @Test // board count(*)
    public void pageHandling() throws Exception {
        SearchCondition sc = null;
        int total_cnt = boardService.getCount(sc);
        System.out.println(total_cnt);
    }

    @Test // total page 확인
    public void pageHandling2() throws Exception {
        SearchCondition sc = null;
        int total_cnt = boardService.getCount(sc);
        PageHandler ph = new PageHandler(total_cnt, sc);
        System.out.println("ph.getTotalPage() = " + ph.getTotalPage());
        System.out.println("Math.min((21 + 10 - 1), ph.getTotalPage()) = " + Math.min((21 + 10 - 1), ph.getTotalPage()));
    }

    @Test // category 페이징 핸들링
    public void pageHandling3() throws Exception {
        SearchCondition sc = null;
        int total_cnt = boardService.getCount(sc);
        PageHandler ph = new PageHandler(total_cnt, sc);
        List<BoardDto> list = boardService.getPage(sc);
        ListIterator<BoardDto> listIterator = list.listIterator();
        while (listIterator.hasNext()) {
            BoardDto boardDto = listIterator.next();
            System.out.println("boardDto = " + boardDto);
        }
    }

    @Test // 시간 테스트
    public void timeTest() throws Exception {
//        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        ZonedDateTime startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault());
//        System.out.println(startOfToday.toEpochMilli());
        System.out.println(startOfToday.toEpochSecond());
        System.out.println(startOfToday);

        SearchCondition sc = null;
        int total_cnt = boardService.getCount(sc);
        PageHandler ph = new PageHandler(total_cnt, sc);
        List<BoardDto> list = boardService.getPage(sc);
        ListIterator<BoardDto> listIterator = list.listIterator();
            BoardDto boardDto = listIterator.next();
        System.out.println("boardDto.getReg_date().toLocalTime() = " + boardDto.getReg_date().toLocalTime());
        System.out.println("boardDto.getReg_date().atZone(ZoneId.systemDefault()) = " + boardDto.getReg_date().atZone(ZoneId.systemDefault()));
        System.out.println("boardDto.getReg_date().getSecond() = " + boardDto.getReg_date().getNano());
        long milliSeconds = Timestamp.valueOf(boardDto.getReg_date()).getTime();
        System.out.println("milliSeconds = " + milliSeconds);

    }
}
