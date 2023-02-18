/**
 * 
 */let rowCount = document.querySelector(".removeitem").rows.length-1;
 let removeform =  document.querySelector(".remove-item-form");
 let removeformcnt = 0;
 let indexes="";
 //let tr;
const tr = document.querySelectorAll("tr");
 for (let i = 0; i < tr.length; i++) {
     tr[i].addEventListener("click", function(e) {
       	e.target.parentElement.style.backgroundColor = "rgb(161, 255, 161)";
       	indexes+=JSON.stringify( e.target.parentElement.id).charAt(4)+" ";
     });
 }
 /*
for(let i=0;i<rowCount;i++){
    tr = document.querySelector("#row"+(i+1));	
    tr.addEventListener("onclick",trClick(i+1));
}*/
/*
function trClick(ind){
	alert("clicked !");
	let name = document.getElementById ( "name"+ind ).innerText;
	let price = document.getElementById ( "price"+ind ).innerText;
    let input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "name"+ind);
	input.setAttribute("value", name);
	removeform.appendChild(input);
	input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "price"+ind);
	input.setAttribute("value", price);
	removeform.appendChild(input);
	tr.style.backgroundColor = "rgb(95, 255, 95)";
	removeformcnt++;
	indexes+=ind+" ";
}
*/
document.querySelector("#remove-form-submit").addEventListener("click",()=>{
	let input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "size");
	input.setAttribute("value", removeformcnt);
	removeform.appendChild(input);
	input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "indexes");
	input.setAttribute("value", indexes);
	removeform.appendChild(input);
	removeform.submit();
});