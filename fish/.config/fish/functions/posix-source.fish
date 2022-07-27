# http://lewandowski.io/2016/10/fish-env/
function posix-source -d 'Sources a dotenv-style env file'
	for i in (cat $argv)
		set arr (echo $i |tr = \n)
		set -gx $arr[1] $arr[2]
	end
end
