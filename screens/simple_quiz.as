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
	trace(name)
	if('btn_submit'==name){
		if(selectedChoice==correct){
			MovieClip(this.getChildByName('btn_'+selectedChoice)).marker.gotoAndStop('correct');
			inst.htmlText = '<b>Correct!</b> ' + theFeedback;
			audio_mc.gotoAndStop('correct');
			emoticon.gotoAndStop('success');
			finished.visible = true;
		}else{
			MovieClip(this.getChildByName('btn_'+selectedChoice)).marker.gotoAndStop('wrong');
			btn_check.visible=true;
			emoticon.gotoAndStop('failed');
			if(theFeedback.indexOf('click')>=0){
				theFeedback = 'Click Check to see the correct answer.';
			}
			inst.htmlText = '<b>No!</b> ' + theFeedback;
			finished.visible = true;
		}
		btn_submit.visible=false;
	}else if('btn_check'==name){
		MovieClip(this.getChildByName('btn_'+correct)).marker.gotoAndStop('correct');
		btn_check.visible=false;
		inst.text = 'Click next to continue.';
		finished.visible = true;
	}else{
		inst.text = 'Congrats! please click next to continue.';
		finished.visible = true;
	}
}