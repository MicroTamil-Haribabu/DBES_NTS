
inst.text = "Choose the correct answer.";
finished.visible = false;
finished.enabled = false;
btn_submit.visible = false;
btn_submit.txt.text = 'Submit';
btn_next.visible = false;
btn_next.txt.text = 'Next';
btn_check.visible = false;
btn_check.txt.text = 'Check';

for(var i:Number=1;i<=choices.length;i++){
	MovieClip(this.getChildByName('btn_'+i)).txt.text = choices[i-1];
}

function selectedBtn(name){
	for(var i:Number=1;i<=choices.length;i++){
		MovieClip(this.getChildByName('btn_'+i)).marker.gotoAndStop('normal');
	}
	btn_submit.visible = true;
	selectedChoice = name.split('_')[1];
	MovieClip(this.getChildByName(name)).marker.gotoAndStop('selected');
}

function validate(name):void{
	var par:MovieClip = this.parent.parent.parent as MovieClip;
	if('btn_submit'==name){
		par.totalQuestion++;
		if(selectedChoice==correct){
			MovieClip(this.getChildByName('btn_'+selectedChoice)).marker.gotoAndStop('correct');
			inst.text = 'Congrats! please click next to continue.';
			audio_mc.gotoAndStop('correct');
			finished.visible = true;
			par.nextBtn.enabled=true
			par.nextBtn.alpha = 1
			par.correctAns++
			finished.visible=true;
		}else{
			MovieClip(this.getChildByName('btn_'+selectedChoice)).marker.gotoAndStop('wrong');
			btn_check.visible=true;
			inst.text = 'See the correct answer.';
		}
		btn_submit.visible=false;
	}else if('btn_check'==name){
		MovieClip(this.getChildByName('btn_'+correct)).marker.gotoAndStop('correct');
		btn_check.visible=false;
		inst.text = 'Click next to continue.';
		finished.visible = true;
		par.nextBtn.enabled=true
		par.nextBtn.alpha = 1
	}else{
		inst.text = 'Congrats! please click next to continue.';
		finished.visible = true;
	}
}