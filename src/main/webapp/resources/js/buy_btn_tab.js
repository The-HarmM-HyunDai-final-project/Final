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
    });
});