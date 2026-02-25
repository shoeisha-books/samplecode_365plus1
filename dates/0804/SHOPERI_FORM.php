<?php 
if ($_SERVER["REQUEST_METHOD"] == "POST") { 
    $name = $_POST["name"];
    $msg = $_POST["message"]; 
} else { 
    header("Location: contact.php"); 
} 
?>
<html>
<head><title>応援メッセージフォーム</title></head>
<body>
<h1>応援メッセージ</h1>
<p>応援メッセージをありがとうペリ〜！
以下の内容で送信するペリよ！</p>
<table>
    <tr><td>名前：</td><td>
    <?php echo htmlspecialchars($name, ENT_QUOTES, 'UTF-8'); ?>
    </td></tr>
    <tr><td>ショウペリとトビーへのメッセージをどうぞ！：
    </td><td>
    <?php echo htmlspecialchars($msg, ENT_QUOTES, 'UTF-8'); ?>
    </td></tr>
</table>
<form method="post" action="send.php">
<input type="hidden" name="name"
        value="<?php echo $name; ?>">
<input type="hidden" name="message"
        value="<?php echo $msg; ?>">
<input type="submit" value="送信ペリ！">
<button type="button" onclick="history.back()">
        戻るペリ！</button>
</form></body></html>