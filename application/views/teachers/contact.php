<style type="text/css">
#teacher_email {
	font-size: 12pt;
}
#contact_form td {
	vertical-align: middle;
	padding: 5px;
}
#contact_form td:first-child {
	text-align: right;
}
#contact_form input, #contact_form textarea {
	width: 400px;
}
#contact_form #contact_form_verify {
	width: 200px;
}
#contact_form tr:last-child td {
	text-align: center;
}
#contact_form tr:last-child td input {
	width: 100px;
	height: 30px;
}
</style>

<div id="content_left">
	<div id="content_left_above">
		<div class="fancybox">
			<h2 class="fancytitle">Contact <?=$teacher->name?></h2>
			<p>You may either contact this teacher via direct email if he/she allows it, or you may send an email directly from this page via the form provided.</p>
			<p>
			<h3>Contact via direct email:</h3>
			<?php
			if ($email_display_allowed == true) {
				echo safe_mailto($teacher->email, $teacher->email, array('id' => 'teacher_email'));
			} else {
				echo "<i>This teacher has disabled direct email contact, please use the form below.";
			}
			?>
			</p><p>
			<h3>Contact via form:</h3>
			<?php
				$this->load->helper('form');
				echo form_open('teachers/' . $teacher->username . '/contact/send');
				
				$fields = array('Your Email Address:' => 'email_address', 'Subject:' => 'subject');
				
				echo '<table id="contact_form">';
				foreach ($fields as $label=>$name) {
					echo '<tr><td>';
					echo form_label($label, 'contact_form_' . $name);
					echo '</td><td>';
					echo form_input(array('name' => $name, 'id' => 'contact_form_' . $name));
					echo '</td></tr>';
				}
				
				echo '<tr><td>Message:</td><td>';
				echo form_textarea(array('name' => 'contents', 'id' => 'contact_form_contents'));
				echo '</td></tr>';
				
				echo '<tr><td>';
				echo form_label('Enter Code:', 'contact_form_verify');
				echo '</td><td>';
				echo $cap['image'];
				echo '<br />';
				echo form_input(array('name' => 'verify', 'id' => 'contact_form_verify'));
				echo '</td></tr>';
				
				echo '<tr><td colspan="2">';
				echo form_submit('sendEmail', 'Send');	
				echo '</td></tr>';
				
				echo '</table>';
				
				echo form_close();
			?>
			</p>
		</div>
	</div>
</div>
