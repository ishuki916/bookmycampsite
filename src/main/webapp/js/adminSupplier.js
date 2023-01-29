//Close Modal


// When the user clicks anywhere outside of the modal, close it
//window.onclick = function(event) {
	//var modal = document.getElementById('canBtn');
	//if (event.target == modal) {
	//	modal.style.display = "none";
	////}
//}


const myModal = new bootstrap.Modal('#myModal'); //Modal名稱
document.querySelector('.btn btn-secondary').addEventListener('click',()=>{ 
myModal.hide(); 
})


//function myFunction() {
//	var x = document.getElementById("myText").value;
//	if (x.length = 0) {
//		document.getElementById("demo").innerHTML = 0;
//	} else {
//		document.getElementById("demo").innerHTML = x;
	//}
//}

//按下Submit案件取得輸入值
//function addSupplier() {
//var bzId = document.getElementById("bzId").value;
//var supplierName = document.getElementById("supplierName").value;
//var rul = /^[0-9]{8}$/;
//var result = Number(rul.test(bzId));
//if (result === 1) {console.log("ok"); }
//else { document.getElementById("errorBzId").innerHTML = "please enter0-9"; }
//}


//var supplierAddress = document.getElementById("supplierAddress").value;
//var supplierPhone = document.getElementById("supplierPhone").value;
//var supplierWebsite = document.getElementById("supplierWebsite").value;
//var supplierPhone = document.getElementById("supplierPhone").value;
//var remarks = document.getElementById("remarks").value;





