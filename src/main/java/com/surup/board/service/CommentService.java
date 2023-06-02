package com.surup.board.service;

import com.surup.board.domain.CommentDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CommentService {
    // SELECT
    List<CommentDto> getCommentAll(Integer bno) throws Exception;

    List<CommentDto> getReplyAll(Integer cno) throws Exception;

    int getPcnoCount(Integer bno) throws Exception;

    CommentDto getComment(Integer cno) throws Exception;

    // INSERT
    @Transactional(rollbackFor = Exception.class)
    int registerComment(CommentDto commentDto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int registerReply(CommentDto commentDto) throws Exception;

    // DELETE
    @Transactional(rollbackFor = Exception.class)
    int deleteComment(Integer cno) throws Exception;

    // UPDATE
    int updateComment(CommentDto commentDto) throws Exception;
}
