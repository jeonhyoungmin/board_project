classDiagram
direction BT
class BoardController {
  + BoardController() 
  + readView(Integer, HttpServletRequest, RedirectAttributes, Model) String
  + remove(Integer, String, HttpSession, RedirectAttributes) String
  + writeView(HttpServletRequest, HttpSession, RedirectAttributes, Model) String
  + modifyView(Integer, String, RedirectAttributes, Model) String
  + write(BoardDto, HttpSession, RedirectAttributes, Model) String
  + modify(Integer, BoardDto, String, RedirectAttributes, HttpSession) String
}
class BoardDao {
<<Interface>>
  + selectPage(SearchCondition) List~BoardDto~
  + delete(Integer) int
  + updateViewCnt(Integer) int
  + selectAll() List~BoardDto~
  + insert(BoardDto) int
  + selectOne(Integer) BoardDto
  + count(SearchCondition) int
  + updateCommentCnt(Integer, Integer) int
  + updateBoard(BoardDto) int
}
class BoardDaoImpl {
  + BoardDaoImpl() 
  + count(SearchCondition) int
  + delete(Integer) int
  + insert(BoardDto) int
  + selectAll() List~BoardDto~
  + updateCommentCnt(Integer, Integer) int
  + updateViewCnt(Integer) int
  + updateBoard(BoardDto) int
  + selectPage(SearchCondition) List~BoardDto~
  + selectOne(Integer) BoardDto
}
class BoardDto {
  + BoardDto() 
  + BoardDto(String, String, String, String) 
  - Integer view_cnt
  - String writer
  - LocalDate trans_reg_date
  - LocalDateTime up_date
  - String reg_date_format_date
  - int numbering
  - Integer comment_cnt
  - String title
  - long reg_date_milliseconds
  - String category
  - LocalDateTime reg_date
  - Integer bno
  - String content
  - String reg_date_format_time
  + hashCode() int
  + equals(Object) boolean
  + toString() String
   LocalDateTime up_date
   Integer bno
   Integer comment_cnt
   String reg_date_format_date
   String reg_date_format_time
   int numbering
   Integer view_cnt
   LocalDateTime reg_date
   LocalDate trans_reg_date
   String content
   String title
   long reg_date_milliseconds
   String writer
   String category
}
class BoardListController {
  + BoardListController() 
  + boardListPage(SearchCondition, Model) String
}
class BoardService {
<<Interface>>
  + getWriterId(Integer) String
  + registerBoard(String, BoardDto) int
  + getBoardOne(Integer) BoardDto
  + registerBoard(BoardDto) int
  + getPage(SearchCondition) List~BoardDto~
  + deleteBoardOne(Integer) int
  + getCount(SearchCondition) int
  + updateBoardOne(BoardDto) int
   List~BoardDto~ boardAll
}
class BoardServiceImpl {
  + BoardServiceImpl() 
  + registerBoard(BoardDto) int
  + getWriterId(Integer) String
  + updateBoardOne(BoardDto) int
  + deleteBoardOne(Integer) int
  + getCount(SearchCondition) int
  + getBoardOne(Integer) BoardDto
  + registerBoard(String, BoardDto) int
  + getPage(SearchCondition) List~BoardDto~
   List~BoardDto~ boardAll
}
class CommentController {
  + CommentController() 
  + viewCommentsAll(Integer) ResponseEntity~List~CommentDto~~
  + viewCommentsAll(String) ResponseEntity~Map~
  + writeComments(String, CommentDto, HttpSession) ResponseEntity
  + putComments(Integer, String, CommentDto, HttpSession) ResponseEntity
  + deleteComments(Integer, HttpSession) ResponseEntity
}
class CommentDao {
<<Interface>>
  + countPcno(Integer) int
  + selectAll(Integer) List~CommentDto~
  + insert(CommentDto) int
  + delete(Integer) int
  + replyInsert(CommentDto) int
  + select(Integer) CommentDto
  + pcnoUpdate(Integer, Integer) int
  + selectPcnoAll(Integer) List~CommentDto~
  + update(CommentDto) int
}
class CommentDaoImpl {
  + CommentDaoImpl() 
  + selectAll(Integer) List~CommentDto~
  + select(Integer) CommentDto
  + insert(CommentDto) int
  + countPcno(Integer) int
  + update(CommentDto) int
  + pcnoUpdate(Integer, Integer) int
  + selectPcnoAll(Integer) List~CommentDto~
  + replyInsert(CommentDto) int
  + delete(Integer) int
}
class CommentDto {
  + CommentDto(Integer, Integer, String, String) 
  + CommentDto() 
  + CommentDto(Integer, String, String) 
  - String trans_reg_date
  - String comment
  - Date up_date
  - Boolean modify
  - String trans_up_date
  - Date reg_date
  - Integer pcno
  - Integer bno
  - Integer cno
  - String commenter
  + toString() String
   String comment
   Date up_date
   Integer cno
   Integer bno
   String commenter
   Date reg_date
   Boolean modify
   Integer pcno
   String trans_up_date
   String trans_reg_date
}
class CommentService {
<<Interface>>
  + updateComment(CommentDto) int
  + getCommentAll(Integer) List~CommentDto~
  + getPcnoCount(Integer) int
  + getComment(Integer) CommentDto
  + registerReply(CommentDto) int
  + registerComment(CommentDto) int
  + getReplyAll(Integer) List~CommentDto~
  + deleteComment(Integer) int
}
class CommentServiceImpl {
  + CommentServiceImpl() 
  + getComment(Integer) CommentDto
  + getPcnoCount(Integer) int
  + deleteComment(Integer) int
  + updateComment(CommentDto) int
  + getCommentAll(Integer) List~CommentDto~
  + getReplyAll(Integer) List~CommentDto~
  + registerReply(CommentDto) int
  + registerComment(CommentDto) int
}
class GlobalCatcher {
  + GlobalCatcher() 
  + catcher1(Exception, Model) String
}
class PageHandler {
  + PageHandler(Integer, Integer) 
  + PageHandler(int, SearchCondition) 
  + PageHandler(Integer, Integer, Integer) 
  - int beginPage
  - int nextPage
  - int total_cnt
  - boolean nextPageActive
  - int prePage
  - int totalPage
  - int NAVI_SIZE
  - int endPage
  - boolean prePageActive
  - SearchCondition sc
  + toString() String
  - paging(int, SearchCondition) void
   int totalPage
   int total_cnt
   int prePage
   boolean nextPageActive
   SearchCondition sc
   int beginPage
   int nextPage
   int endPage
   boolean prePageActive
   int NAVI_SIZE
}
class ReplyCommentController {
  + ReplyCommentController() 
  + viewReplyAll(Integer) ResponseEntity~List~CommentDto~~
  + writeReply(CommentDto, HttpSession) ResponseEntity
}
class SearchCondition {
  + SearchCondition() 
  + SearchCondition(Integer, Integer, String, String, String) 
  + SearchCondition(Integer, Integer) 
  - Integer pageSize
  - String keyword
  - Integer page
  - String option
  - String category
  + getQueryString(Integer, String, String, String) String
  + getQueryString(Integer, String) String
  + getQueryString(Integer) String
  + toString() String
   String keyword
   Integer pageSize
   String queryString
   Integer offset
   Integer page
   String category
   String option
}
class SignUpController {
  + SignUpController() 
  + idCheck(String) HashMap
  ~ validation(UserDto, Model, Object, String, String, String, boolean) String?
  + signup() String
  + nicknameCheck(String) HashMap
  - dupl_check(Model, String, String) String?
  + registerUser(UserDto, Model, boolean, RedirectAttributes) String
  - fetch_dupl_check(String, String) HashMap
}
class UserController {
  + UserController() 
  + loginPage(HttpServletRequest, Model) String
  + certificationPage() String
  + certification(String, String, Model, HttpSession, RedirectAttributes) String
  + login(String, String, boolean, String, Model, HttpServletRequest, HttpServletResponse) String
  + modifyUser(HttpSession, UserDto, Model) String
  - userCheck(String, String) boolean
  - checkFailMsg(Model) String
  + logout(HttpSession) String
  + deleteAccount(UserDto, Model, HttpServletResponse, HttpSession, RedirectAttributes) String
  - transLDTtoLD(UserDto) void
}
class UserDao {
<<Interface>>
  + selectEmail(String) UserDto
  + insert(UserDto) int
  + deleteAll() int
  + selectNickname(String) UserDto
  + selectId(String) UserDto
  + deleteUser(String) int
  + updatePwd(UserDto) int
  + selectAll() List~UserDto~
}
class UserDaoImpl {
  + UserDaoImpl() 
  + selectNickname(String) UserDto
  + selectEmail(String) UserDto
  + deleteAll() int
  + updatePwd(UserDto) int
  + selectAll() List~UserDto~
  + selectId(String) UserDto
  + deleteUser(String) int
  + insert(UserDto) int
}
class UserDto {
  + UserDto(String, String, String, Character, Integer, String, String, LocalDate) 
  + UserDto() 
  - String pwd
  - String username
  - Integer resident_registration_number
  - Character sex
  - LocalDateTime up_date
  - String nickname
  - LocalDateTime reg_date
  - String pwdcheck
  - String email
  - LocalDate trans_reg_date
  - LocalDate birth
  - String id
  + equals(Object) boolean
  + toString() String
   LocalDateTime up_date
   Character sex
   LocalDate trans_reg_date
   String email
   LocalDate birth
   String pwdcheck
   String username
   String nickname
   String pwd
   String id
   LocalDateTime reg_date
   Integer resident_registration_number
}
class UserService {
<<Interface>>
  + updatePwd(UserDto) int
  + getUser(String) UserDto
  + duplIdCheck(String) UserDto
  + duplNicknameCheck(String) UserDto
  + deleteAccount(String) int
  + duplEmailCheck(String) UserDto
  + registerUser(UserDto) int
   List~UserDto~ userAll
}
class UserServiceImpl {
  + UserServiceImpl() 
  + registerUser(UserDto) int
  + duplNicknameCheck(String) UserDto
  + duplEmailCheck(String) UserDto
  + getUser(String) UserDto
  + deleteAccount(String) int
  + updatePwd(UserDto) int
  + duplIdCheck(String) UserDto
   List~UserDto~ userAll
}

BoardController "1" *--> "boardService 1" BoardService 
BoardController "1" *--> "userService 1" UserService 
BoardDaoImpl  ..>  BoardDao 
BoardListController "1" *--> "boardDao 1" BoardDao 
BoardListController "1" *--> "boardService 1" BoardService 
BoardListController  ..>  PageHandler : «create»
BoardServiceImpl "1" *--> "boardDao 1" BoardDao 
BoardServiceImpl  ..>  BoardService 
BoardServiceImpl "1" *--> "userDao 1" UserDao 
CommentController "1" *--> "commentService 1" CommentService 
CommentController "1" *--> "userService 1" UserService 
CommentDaoImpl  ..>  CommentDao 
CommentServiceImpl "1" *--> "boardDao 1" BoardDao 
CommentServiceImpl "1" *--> "commentDao 1" CommentDao 
CommentServiceImpl  ..>  CommentService 
PageHandler  ..>  SearchCondition : «create»
PageHandler "1" *--> "sc 1" SearchCondition 
ReplyCommentController "1" *--> "commentService 1" CommentService 
ReplyCommentController "1" *--> "userService 1" UserService 
SignUpController "1" *--> "userService 1" UserService 
UserController "1" *--> "userService 1" UserService 
UserDaoImpl  ..>  UserDao 
UserServiceImpl "1" *--> "userDao 1" UserDao 
UserServiceImpl  ..>  UserService 
