$(document).on('click', '#button', function(){
var recordsform = $('.records-container').last().html();
var recordsformall = $('#all-container').html();
var position = recordsform.indexOf("attributes_");
var numar = recordsformall.match(/attributes_[0-9]/g);
var numar_len = numar.length;
var numar_len_s = "length=" + numar_len.toString();
var test = numar[numar_len - 1];
alert(numar_len_s);
alert(test);
var realmax = test.substring(11,12);
alert(realmax);
var maxnum = parseInt(realmax,10);
var rege1 = "_0_";
var changefrom = new RegExp(rege1,"g");
var changefrom1 = new RegExp("[0]", "g");
var maxnumpl1 = maxnum + 1 ;
var changeto = "_" + maxnumpl1.toString() + "_";
alert("changeto = "+changeto);
var changeto1 = "[" + maxnumpl1.toString() + "]";
recordsform = recordsform.replace(changefrom, changeto);
recordsform = recordsform.replace(changefrom1 , changeto1);
var alertstring = changefrom + "|" + changeto ;
var alertstring2 = recordsform.substring(90, 120);
alert(changefrom+"->"+changeto);
alert(changefrom1+"->"+changeto1)
$('.actions').before(recordsform)});
