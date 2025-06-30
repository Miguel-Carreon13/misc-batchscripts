net use s: /delete /yes
timeout /t 3 /nobreak>nul
net use s: \\ELCEOAECOFSP01\ECOs Eco2014 /user:brkfinishing /persistent:yes
color 0a


net use r: /delete /yes
timeout /t 3 /nobreak>nul
net use r: \\ELCEOAECOFSP01\public Eco2014 /user:brkfinishing /persistent:yes
color 0a

timeout /t 1 /nobreak>nul