//$(document).ready(function() {
//  
//   $('#tags').keypress(function () {   
//    $.ajax({
//     url:"Auto",
//     type:"GET",
//     dataType : 'json',
//     data:$("form").serialize(),
//     success:function(data){
//      $( "#tags" ).autocomplete({   
//          source: data   
//        });
//     
//     },error:  function(data, status, er){
//              console.log(data+"_"+status+"_"+er);
//          },
//           
//    });
//    
//    });
// 
//  });

function showData(value) {
  $.ajax({
  url:"Auto",
  type:"GET",
  dataType : 'json',
  data:$("form").serialize(),
  success:function(data){
   $( "#tags" ).autocomplete({   
       source: data   
     });
  
  },error:  function(data, status, er){
           console.log(data+"_"+status+"_"+er);
       },
        
 });
 
}