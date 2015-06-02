var commentController = {};

commentController.totalNum = 0;
commentController.comments = [];
commentController.isAnonymous = true;
commentController.user = {};

commentController.reference = function(commentID){
  var item;
  $.each(commentController.comments, function(index, val) {
     if (val.commentID == commentID){
      item = val;
     }
  });
  var obj = $('.comment_textarea');
  if (item && obj.length > 0){
    var val = "\r\n[quote] 原帖由 " + item.userName;
    val += " 于 " + item.dateTime + " 发表\r\n";
    val += item.content + "[/quote]\r\n";
    obj.text(val);
    obj.focus();
  }
};

commentController.goodCheck = function(commentID)
{
  var allcookies = document.cookie;
  var cookieName = "stlCommentGood_" + commentID;
  var pos = allcookies.indexOf(cookieName + "=");
  if (pos != -1) {
    notifyService.error('对不起，不能重复操作!');
    return false;
  }else{
    var str = cookieName + "=true";
    var date = new Date();
    var ms = 24*3600*1000;
    date.setTime(date.getTime() + ms);
    str += "; expires=" + date.toGMTString();
    document.cookie = str;
    return true;
  }
};

commentController.good = function(e, commentID)
{
    var item;
    $.each(commentController.comments, function(index, val) {
       if (val.commentID == commentID){
        item = val;
       }
    });

    if (commentController.goodCheck(commentID)){
        commentService.good(commentID);
        $(e).find('span').text(parseInt($(e).find('span').text()) + 1);
    }
};

commentController.submitComment = function(){
    if (commentController.isAnonymous){
      commentController.login();
      return;
    }
    var content = $('.comment_textarea').val();
    if (content){
      commentService.submitComment(content, function(data) {
        if (data.isSuccess){
          commentController.totalNum += 1;
          data.comment.floor = commentController.totalNum;
          commentController.comments.splice(0, 0, data.comment);
          notifyService.success(data.successMessage);
          utilService.render('commentController', commentController);
        }else{
          notifyService.error(data.errorMessage);
        }
      });
    }else{
      $('.comment_textarea').focus();
    }
};

commentController.getCommentParameter = function(){
  commentService.getCommentParameter(function (data) {

    if (data.isSuccess){
      commentController.totalNum = data.totalNum;
      if (data.comments){
        commentController.comments = data.comments;
      }
      commentController.user = data.user;
      commentController.isAnonymous = data.isAnonymous;
      
      utilService.render('commentController', commentController);
    }
    
  });
};

$(function(){
  commentController.getCommentParameter();
});