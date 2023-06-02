package com.surup.board.service;

import com.surup.board.dao.BoardDao;
import com.surup.board.dao.CommentDao;
import com.surup.board.domain.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.ListIterator;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentDao commentDao;

    @Autowired
    BoardDao boardDao;

    // SELECT
    @Override
    public List<CommentDto> getCommentAll(Integer bno) throws Exception { // bno 에 해당하는 게시물의 전체 댓글 보이기
        return commentDao.selectAll(bno);
    }

    @Override
    public List<CommentDto> getReplyAll(Integer cno) throws Exception { // cno 에 해당하는 전체 답글 보이기
        return commentDao.selectPcnoAll(cno);
    }

    @Override
    public int getPcnoCount(Integer bno) throws Exception { // bno 에 해당하는 게시물의 pcno 개수
        return commentDao.countPcno(bno);
    }

    @Override
    public CommentDto getComment(Integer cno) throws Exception { // cno 에 해당하는 게시물의 댓글 보이기
        return commentDao.select(cno);
    }


    // INSERT
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int registerComment(CommentDto commentDto) throws Exception { // 새로운 댓글 추가
        // comment 의 bno 에 해당하는 board table comment_cnt +1
        int row_cnt = boardDao.updateCommentCnt(commentDto.getBno(), 1);
        // 이후에 댓글 추가
        int rowCnt = commentDao.insert(commentDto);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int registerReply(CommentDto commentDto) throws Exception { // 새로운 답글 추가
        // comment 의 bno 에 해당하는 board table comment_cnt +1
        boardDao.updateCommentCnt(commentDto.getBno(), 1);
        // 댓글의 답글 개수 추가
        commentDao.pcnoUpdate(commentDto.getCno(), -1);
        // 이후에 댓글 추가
        int rowCnt = commentDao.replyInsert(commentDto);
        return rowCnt;
    }


    // DELETE
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteComment(Integer cno) throws Exception { // cno 에 해당하는 댓글 삭제
        // comment 의 bno 에 해당하는 board table comment_cnt -1
        boardDao.updateCommentCnt(commentDao.select(cno).getBno(), -1);

        CommentDto commentDto = commentDao.select(cno);
        if (commentDto.getPcno() > 0) {
            // 만약, 삭제 대상이 pcno (답글)이면 pcno 의 cno (댓글)의 pcno 에 +1을 하여 답글이 삭제됐음을 표시
            // 삭제 대상이 pcno 이라는 것을 아는 방법은, 주어진 cno 의 데이터의 pcno 가 음수가 아니면 pcno 이다.
            // 답글은 양수, 댓글은 음수로 표시하였기 때문.
            commentDao.pcnoUpdate(commentDto.getPcno(), 1);
        } else if(commentDto.getPcno() < 0) {
            // 만약, 삭제 대상이 댓글이며, 답글을 가지고 있을 경우
            // 댓글을 삭제하면, 답글도 함께 모두 삭제
            // 삭제 대상의 pcno 가 음수이면 댓글이다
            List<CommentDto> list = commentDao.selectPcnoAll(cno);
            ListIterator<CommentDto> listIterator = list.listIterator();
            while (listIterator.hasNext()) {
                CommentDto li = listIterator.next();
                boardDao.updateCommentCnt(li.getBno(), -1);
                commentDao.delete(li.getCno());
            }
        }

        // 이후에 댓글 삭제
        int rowCnt = commentDao.delete(cno);
        return rowCnt;
    }


    // UPDATE
    @Override
    public int updateComment(CommentDto commentDto) throws Exception { // cno 에 해당하는 댓글 수정
        return commentDao.update(commentDto);
    }
}
