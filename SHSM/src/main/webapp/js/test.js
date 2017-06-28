 status;
function trigger(data){
	status=data;
	console.log(status)
}
function trigger2(){
	return status;
//	console.log(status);
//	status=false;
}