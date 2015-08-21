<?php

if(isset($_POST['name']) && isset($_POST['email']) && isset($_POST['subject']) && isset($_POST['message'])) {
	$name = $_POST['name'];
	$email = $_POST['email'];
	$subject = $_POST['subject'];
	$message = $_POST['message'];

	$to = 'chris@deacy.io';
	$subjectHeader = 'Portfolio Contact Form';
	$body = "Hey Chris,\n\nYou have a new message from your portfolio contact form.\n\nName: ".$name."\nSubject: ".$subject."\nEmail: ".$email."\nMessage:\n\n".$message;
	$header = "From: ".$email;

	mail($to, $subjectHeader, $body, $header);
}