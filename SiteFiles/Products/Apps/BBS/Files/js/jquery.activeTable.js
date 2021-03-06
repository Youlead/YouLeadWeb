/*http://www.robertnyman.com*/
function makeTheTableHeadsHighlight() {
	var tables = $("table.activeTable");
	$.each( tables, function(i, table){
		var tbody = table.getElementsByTagName('tbody');
		var tbodytds = table.getElementsByTagName('td');
		for (var i=0; i<tbodytds.length; i++) {
			tbodytds[i].oldClassName = tbodytds[i].className;
			tbodytds[i].onmouseover = function() {
				$(this).addClass('on');
				var topheading = $("th." + this.oldClassName, table);
				$(topheading[0]).addClass('on');
				var row = this.parentNode;
				var rowheading = row.getElementsByTagName('th')[0];
				$(rowheading).addClass('on');
			}
		
			tbodytds[i].onmouseout = function() {
				$(this).removeClass('on');
				var topheading = $("th." + this.oldClassName, table);
				$(topheading[0]).removeClass('on');
				var row = this.parentNode;
				var rowheading = row.getElementsByTagName('th')[0];
				$(rowheading).removeClass('on');
			}
		}
	});
}
$(document).ready(function(){
	makeTheTableHeadsHighlight();
});