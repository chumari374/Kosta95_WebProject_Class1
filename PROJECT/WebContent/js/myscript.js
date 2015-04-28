/**
 * 
 */

function ppurija(ad) { 
   $.ajax({ 
      type : 'post', 
      url : ad, 
      async : false, 
         data : {}, 
         error : function(xhr, status) {alert('Unknown error ' + status); }, 
         success : function(data) { 
             $("#main").html(data); 
         } 
   }); 
} 

//function ppurija2(id) { 
//	   $.ajax({ 
//	      type : 'post', 
//	      url : 'Comp/Comp_File/Comp_File_List.jsp', 
//	      async : false, 
//	         data : {}, 
//	         error : function(xhr, status) {alert('Unknown error ' + status); }, 
//	         success : function(data) { 
//	             $("#"+ id).html(data); 
//	         } 
//	   }); 
//	} 
//	
//function ppurija3(id) { 
//	   $.ajax({ 
//	      type : 'post', 
//	      url : 'Comp/Comp_Board/Comp_Board_List.jsp', 
//	      async : false, 
//	         data : {}, 
//	         error : function(xhr, status) {alert('Unknown error ' + status); }, 
//	         success : function(data) { 
//	             $("#"+ id).html(data); 
//	         } 
//	   }); 
//	} 
//
//function ppurija4(id) { 
//	   $.ajax({ 
//	      type : 'post', 
//	      url : 'Comp/Comp_Board/Comp_Board_Write.jsp', 
//	      async : false, 
//	         data : {}, 
//	         error : function(xhr, status) {alert('Unknown error ' + status); }, 
//	         success : function(data) { 
//	             $("#"+ id).html(data); 
//	         } 
//	   }); 
//	} 