
function validator_null(field){
			with(field)
			{
				if(value==null || value==""){
					return false;
				}
				else
					return true;
			}
		}
function validator_email(field1){
		with (field1){
  			apos=value.indexOf("@");
  			dotpos=value.lastIndexOf(".");
  			if (apos<1||dotpos-apos<2)
  				return false;
  			else
  				return true;
			}
		}
function validator_number(field2){
	with (field2){
		var i;
   		for (i = 0; i < value.length; i++){   
        	var c = value.charAt(i);
        	if (((c < "0") || (c > "9"))) 
        		return false;
    	}
    	return true;
	}
}	