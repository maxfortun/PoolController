#!/bin/bash

echo 'Content-type: text/html'
echo

SWD=$(dirname $(readlink -f $0))

pumpStatus=$($SWD/bin/pump/status.sh)
pumpAction="off"

drainStatus=$($SWD/bin/drain/status.sh)
drainAction="open"

cat <<_EOT_
<html>
	<head>
		<title>Pool Control</title>
	</head>
	<body>
		<center>
		<h1>Pool Controller</h1>
		<table>
			<tr>
				<th></th>
				<td>Status</td>
				<td>Action</td>
			</tr>
			<tr>
				<th>Pump</th>
				<td>$pumpStatus</td>
				<td>$pumpAction</td>
			</tr>
			<tr>
				<th>Drain</th>
				<td>$drainStatus</td>
				<td>$drainAction</td>
			</tr>
		</table>
		</center>
	</body>
</html>
_EOT_
