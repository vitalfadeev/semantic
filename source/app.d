import std.stdio;
import std.file : DirEntry;
import classes : Dir;
import classes : File;
import graphiccontext : GraphicContext;
import std.file : dirEntries;
import std.file : SpanMode;


void main()
{
    GraphicContext gc;
 
	auto dirEntries = dirEntries( "c:\\", SpanMode.shallow );

    foreach( dirEntry; dirEntries )
    {
        // Dir
        if ( dirEntry.isDir )
            Dir( dirEntry ).View( &gc );
        else // File
            File( dirEntry ).View( &gc );
    }
}

// GUI
//
// Object View: [ View1, View2, ... ]
//
// Object
//
// Low-Level: File, Folder, ...


