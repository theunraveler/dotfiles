# Defined in /var/folders/k9/sx7m0t050l3dqs4vszcj7mk4977myh/T//fish.MG9mO6/jdk.fish @ line 2
function jdk
	set --export --global JAVA_HOME (/usr/libexec/java_home -v $argv)
	java -version
end
