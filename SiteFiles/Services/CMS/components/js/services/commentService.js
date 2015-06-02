var commentService = {};
commentService.baseUrl = $pageInfo.rootUrl + '/api/comment/';

commentService.getUrl = function(action, id){
  if (id){
    return commentService.baseUrl + action + '/' + id + '?publishmentSystemID=' + $pageInfo.publishmentSystemID + '&channelID=' + $pageInfo.channelID + '&contentID=' + $pageInfo.contentID + '&callback=?';
  }
  return commentService.baseUrl + action + '?publishmentSystemID=' + $pageInfo.publishmentSystemID + '&channelID=' + $pageInfo.channelID + '&contentID=' + $pageInfo.contentID + '&callback=?';
}

commentService.getCommentParameter = function(success){
  $.getJSON(commentService.getUrl('GetCommentParameter'), null, success);
};

commentService.good = function(id){
  $.getJSON(commentService.getUrl('Good', id), null, notifyService.successCallback);
};

commentService.submitComment = function(content, success){
  var data = {content : content};
  $.getJSON(commentService.getUrl('SubmitComment'), data, success);
};