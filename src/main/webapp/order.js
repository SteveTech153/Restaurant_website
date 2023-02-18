/**
 * 
 *//**
 * 
 */let rowCount = document.querySelector(".order").rows.length-1;
 let removeform =  document.querySelector(".order-form");
 let divtotal = document.querySelector(".total");
 let removeformcnt = 0;
 let total = 0;
 //let tr;
const tr = document.querySelectorAll("tr");
 for (let i = 0; i < tr.length; i++) {
     tr[i].addEventListener("click", function(e) {
       	e.target.parentElement.style.backgroundColor = "rgb(161, 255, 161)";
       	total += Number(e.target.parentElement.lastElementChild.innerText);
       	divtotal.innerText = "Total : "+total;
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
document.querySelector("#order-form-submit").addEventListener("click",()=>{
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