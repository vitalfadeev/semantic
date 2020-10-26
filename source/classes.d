import std.stdio : writeln;
import graphiccontext : GraphicContext;
import std.file : dirEntries;
import std.file : DirEntry;
import std.file : SpanMode;


// File
// Open = hexview %s

// ImageFile
// Open = xnview %s

alias void function( Object* ) ClassMethod;
alias ClassMethod[] ClassMethods;

struct ClassCache
{
    // class => methods[]
    ClassMethods[ string ] classMethods;
}


struct Object
{
    void*[] classes; // = [ &classes.dir, &classes.file, &classes.imageFile ]

    void EnumOpen()
    {
        // get class
        // get methods for class
    }
}


struct Classes
{
    Dir       dir;
    File      file;
    ImageFile imageFile;
}


struct File
{
    DirEntry dirEntry;
    alias dirEntry this;


    void View( GraphicContext* gc )
    {
        gc.DrawText( dirEntry.name );
    }
}


struct ImageFile
{
    File file;
    alias file this;

    void View( GraphicContext* gc )
    {
        gc.DrawText( file.dirEntry.name );
    }

    void Open()
    {
        // os.system.execute( "xnview %s" );
    }
}


struct Dir
{    
    DirEntry dirEntry;
    alias dirEntry this;

   
    auto ReadDir()
    {
        return dirEntries( dirEntry.name, SpanMode.shallow );
    }


    void View( GraphicContext* gc )
    {
        gc.DrawText( dirEntry.name ~ "/" );
    }
}


//
struct UIObject
{
    //
}


struct UIPanel
{
    UIObject uiObject;
    alias uiObject this;
}


struct UIButton
{
    UIObject uiObject;
    alias uiObject this;


    void View( GraphicContext* gc )
    {
        // gc.DrawFilledRect( ... )
    }


    void Open()
    {
        // writefln( "Button %s clicked", this )
    }
}


struct UICloseWindowButton
{
    UIObject uiButton;
    alias uiButton this;

    void View( GraphicContext* gc )
    {
        // gc.DrawFilledRect( ... )
        // gc.DrawIcon( "close-window.ico" )
    }


    void Open()
    {
        // win = GetActieWindow()
        // CloseWindow( win )
    }
}

