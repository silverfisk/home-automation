#!/bin/bash

STATUS=$(/usr/bin/tdtool --list |egrep '^4' |awk '{print $7}')


echo "<html>
<body>
<center>
 <h1>Temperatures and controls</h1>
 Heat circulation pump status is: <b> $STATUS </b>. Status was last checked $(date)
 <img src=\"./livingroom.png\" />
 <img src=\"./outside.png\" />
</center>
</body>
</html>"
