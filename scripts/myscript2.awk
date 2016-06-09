#!/usr/bin/awk -f
#
# AWK script
BEGIN {
    FS=":"
}
{
    if ( $1 == "_dovenull" )
    {
	if ( $3 == 227 )
	{
	    print "foo"
	}
	else
	{
	    print "no foo"
	}
    }
    else if ( $3 == "bar" )
    {
	    print "something is wrong"
    }
    else
    {
	print "shouldn't be here"
    }
}
