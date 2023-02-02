/**
 * 
 */
/**
 * 
 */

   var links = document.querySelectorAll('.deadline_tab a');
        Array.prototype.forEach.call(links, function(elem){    
            elem.addEventListener("click", function(){
                Array.prototype.forEach.call(links, function(elem){ 
                    elem.classList.remove("is_active");
                });
                this.classList.add("is_active");  
                //console.log(document.getElementById(this.classList.add("is_active")).innerText);
            });
        });
function agree_click(item) {
        var text = $(item).text()
		
      console.log(text);
        text = text.trim();
        
        document.getElementById("dDay").value = parseInt(text);
        
     
}