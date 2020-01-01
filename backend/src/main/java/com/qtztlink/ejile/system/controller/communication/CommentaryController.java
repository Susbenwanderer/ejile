package com.qtztlink.ejile.system.controller.communication;

import com.qtztlink.ejile.common.bean.ResponseBean;
import com.qtztlink.ejile.common.exception.UnauthorizedException;
import com.qtztlink.ejile.system.model.communication.Commentary;
import com.qtztlink.ejile.system.service.communication.CommentaryService;
import com.qtztlink.ejile.system.service.goods.OrderHistoryService;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.*;
import java.util.Date;
import java.util.List;

@RestController
@Validated
public class CommentaryController {
    @Autowired
    private CommentaryService commentaryService;

    @Autowired
    private OrderHistoryService orderHistoryService;

    @RequestMapping("/commentary/getInfoByCoid")
    @ResponseBody
    public ResponseBean getCommentaryInfoByCoid(@RequestParam("Coid") int coid) {
        Commentary commentary = this.commentaryService.queryCommentaryByCoID(coid);
        if(commentary!=null){
            return new ResponseBean()
                    .code(200)
                    .message("Success")
                    .data(commentary);
        }else {
            return new ResponseBean()
                    .code(200)
                    .message("Not found")
                    .data(null);
        }
    }

    // 根据用户查询评论
    @RequestMapping("/commentary/getInfoByUid")
    @ResponseBody
    public ResponseBean getCommentaryInfoByUid(@RequestParam("UID") int uid) {
        List<Commentary> commentaries = this.commentaryService.queryCommentaryByUID(uid);
        if(commentaries!=null){
            return new ResponseBean()
                    .code(200)
                    .message("Success")
                    .data(commentaries);
        }else {
            return new ResponseBean()
                    .code(200)
                    .message("Not found")
                    .data(null);
        }
    }


    @RequestMapping("/commentary/getInfoBySid")
    @ResponseBody
    public ResponseBean getCommentaryInfoBySid(@RequestParam("Sid") int sid){
        List<Commentary> commentaryList = this.commentaryService.queryCommentaryBySID(sid);
        if(commentaryList != null) {
            return new ResponseBean()
                    .code(200)
                    .message("Success")
                    .data(commentaryList);
        } else {
            return new ResponseBean()
                    .code(200)
                    .message("Not found")
                    .data(null);
        }
    }

    @RequestMapping("/commentary/deleteCommentaryByCoid")
    @ResponseBody
    public ResponseBean deleteCommentaryByCoid(@RequestParam("Coid") int coid)
            throws Exception{
        int res = this.commentaryService.deleteCommentaryById(coid);
        if(res==1){
            return new ResponseBean()
                    .code(200)
                    .message("Success")
                    .data(1);
        }else{
            throw new UnauthorizedException("删除失败，请联系管理员");
        }
    }

    @RequestMapping("/commentary/addCommentary")
    @ResponseBody
    public ResponseBean addCommentary(
            int cid,
            int sid,
            Date cotime,
            @Length(min = 1, max = 1024, message = "{range}") String content,
            @Min(value = 1, message = "{minValue}")
            @Max(value = 5, message = "{maxValue}") int stars
    ) throws Exception{
//        OrderHistory orderHistory = this.orderHistoryService.queryOrderHistoryByOid(oid);
//        if (orderHistory == null) {
//            throw new UnauthorizedException("此订单不存在啦~");
//        }
//        orderHistory.setState("已完成");
//        if (this.orderHistoryService.update(orderHistory) == 0) {
//            throw new UnauthorizedException("未知错误!");
//        }

        Commentary commentary = new Commentary();
        commentary.setCid(cid);
        commentary.setSid(sid);
        commentary.setTime(cotime);
        commentary.setContent(content);
        commentary.setStars(stars);
        int res = this.commentaryService.add(commentary);
        if(res==1){
            return new ResponseBean()
                    .code(200)
                    .message("Success")
                    .data(1);
        }else{
            throw new UnauthorizedException("评论发表失败，请联系管理员");
        }
    }

    @RequestMapping("/commentary/updateCommentary")
    @ResponseBody
    public ResponseBean updateCommentary(
            int coid,
            Date cotime,
            @Length(min = 1, max = 1024, message = "{range}") String content,
            @Min(value = 1, message = "{minValue}")
            @Max(value = 5, message = "{maxValue}") Integer stars
    ) throws Exception {
        Commentary commentary = this.commentaryService.queryCommentaryByCoID(coid);
        if(commentary==null){
            throw new UnauthorizedException("此评论已被删除，请联系管理员");
        }
        commentary.setTime(cotime);
        commentary.setContent(content);
        commentary.setStars(stars);

        int res = this.commentaryService.update(commentary);
        if(res==0){
            throw new UnauthorizedException("修改失败，请联系管理员");
        }else{
            return new ResponseBean()
                    .code(200)
                    .message("Success")
                    .data(1);
        }
    }
}
