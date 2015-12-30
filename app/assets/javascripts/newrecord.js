$(document).on('click', '#button', function(){
var recordsform = $('.records-container').html();
var recordsformall = $('#all-container').html();
var numar = recordsformall.match(/attributes_[0-9]/g);
var numar_len = numar.length;
var maxnumstr = numar[numar_len - 1];
var realmax = maxnumstr.substring(11,12);
var maxnum = parseInt(realmax,10);
var rege1 = "_0_";
var rege2 = "\[0\]";
var changefrom = new RegExp(rege1,"g");
var changefrom1 = new RegExp(/\[[0-9]\]/g);
var maxnumpl1 = maxnum + 1 ;
var changeto = "_" + maxnumpl1.toString() + "_";
var changeto1 = "[" + maxnumpl1.toString() + "]";
recordsform = recordsform.replace(changefrom, changeto);
recordsform = recordsform.replace(changefrom1 , changeto1);
$('.actions').before(recordsform)});
