# compress-toClipboard.ps1
# g.k. 5.2022

[string] $chars = ""
[string] $text = ""
[string] $file = ""

# Idee: von file, wenn $args[0] sonst vom Clipboard
if($args[0] -eq $null) {
	$file = Get-Clipboard -Format Text -Raw
} else {
	if(Test-Path -LiteralPath $args[0].ToString() -ErrorAction SilentlyContinue) {
		$file = Get-Content -LiteralPath $args[0].ToString() -Raw
	} else {
		"cannot load " + $args[0].ToString() | Out-Host
		Return
	}  
}

$file.split("`n") | ForEach-Object {
	#[regex]::Escape('[hello]')
	$chars = $PSItem
	# Problem: "\/\/.*" erwischt http://www ... auch
	$chars = $chars -replace "([^:])\/\/.*", "$1"
	# Folgeproblem: // kommt ohne : vor
	$chars = $chars -replace "^[ `t]*\/\/.*", ""
	#we can catch oneline /* ... */
	$chars = $chars -replace "\/\*.*\*\/", ""
	# removes leading or trailing whitespace
	$chars = $chars -replace "^[ `t]+", ""
	$chars = $chars -replace "[ `t]+$", ""	
	# append nonempty lines to results
	if(![string]::IsNullOrWhiteSpace($chars)) {
		$text += $chars + "`n"
	}    
}
" " + $text.Length + " chars" | Out-Host
Set-Clipboard -Value $text
