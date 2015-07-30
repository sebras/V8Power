# V8Power
Putting the power of an 8-cylinder engine under the hood of DOS batch files.

* * *

The V8Power project is being designed in cooperation with
[Jim Hall](http://www.freedos.org/jhall) for the [FreeDOS™](http://www.freedos.org) 
operating system. It is intended to expand the functionality of scripts written 
using batch files and to provide them with a better looking user interface with
increased functionality.

* * *

## Compiling V8Power

#### &nbsp;&nbsp; Prerequisites ######

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8086 or better cpu. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EGA or better video adapter. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[FreeDOS 1.1 or higher](http://www.freedos.org) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[NASM for DOS version 2.11.08](http://wwww.nasm.us]) <br>

#### &nbsp;&nbsp; Compiling ######

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insure the NASM directory is in your path spec. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Run the mkV8.bat script. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All executibles will be placed in newly
created BIN directory. <br>

* * *

## V8Power Usage

> Some basic information reguarding all utilities and how they operate.<br>
> * Options, values and hexidecimal numbers are not case specific **/f white** equals **/F wHIte**<br>
> * Hexidecimal numbers may be prefixed with **0x** to prevent them from being treated as base ten.<br>
> * Spaces are optional. **/B7/f0** is the same as **/B 7 /F 0**. But, not **/ B7 / F0**<br>
> * To use a **/** or spaces in a value, put it in qoutes. Like **"Jack and/or Jill"**<br>
> * Use multiple qoutes to use quotes. Like **"Jack's house"** or **'Say "What?"**<br>
> * Unless overriden, most utilities use the text attribute at the current cursor location.

* * *
#### vcls *[options]* ######
Clear screen.
<table>
<tr><td></td><td>Clear the screen with the current text attribute</td></tr>
<tr><td><b><i>n</i></b></td><td>Set text attribute to <b><i>n</i></b></td></tr>
<tr><td><b>/A <i>n</i></a></td><td>Set text attribute to <b><i>n</i></b></td></tr>
<tr><td><b>/B <i>color</i></b></td><td>Set the background text attribute to <b><i>color</i></b> (or <b><i>value</i></b>)</td></tr>
<tr><td><b>/F <i>color</i></b></td><td>Set the forground text attribute to <b><i>color</i></b> (or <b><i>value</i></b>)</td></tr>
<tr><td><b>/T</b></td><td>Clear the text only. Leave all colors intact and ignore attributes.</td></tr>
<tr><td><i>tba</i></td><td><i>(Under development, to be announced)</i></td></tr>
</table>
* * *
#### vcursor *[options]* ######
Change the cursor size and shape.
<table>
<tr><td></td><td>Outputs the current cursor shape to <b>STDOUT</b></td></tr>
<tr><td><b><i>n</i></b></td><td>Set the current cursor shape as <b><i>n</i></b></td></tr>
<tr><td><b>HIDE</b></td><td>Hides the cursor.</td></tr>
<tr><td><b>SMALL</b></td><td>Sets a small cursor</td></tr>
<tr><td><b>HALF</b></td><td>Sets the cursor to 1/2 text height</td></tr>
<tr><td><b>FULL</b></td><td>Sets the cursro to the full height of text</td></tr>
</table>
* * *
#### vdelay *[ms]* ######
Simple delay.
<table>
<tr><td></td><td>Default is 1000ms (1 second) delay.</td></tr>
<tr><td><b><i>ms</i></b></td><td>Delay for <b><i>ms</i></b> milliseconds. (0-65535, 0x0000-0xffff) </td></tr>
</table>
* * *
#### vecho *[options]* *[text]* ######
<table>
<tr><td></td><td>Preforms a Carriage Return and Line Feed to the display</td></tr>
<tr><td><b><i>text</i></b></td><td>Writes <b><i>text</i></b> to the display</td></tr>
<tr><td><b>/A <i>n</i></a></td><td>Set text attribute to <b><i>n</i></b></td></tr>
<tr><td><b>/B <i>color</i></b></td><td>Set the background text attribute to <b><i>color</i></b> (or <b><i>value</i></b>)</td></tr>
<tr><td><b>/F <i>color</i></b></td><td>Set the forground text attribute to <b><i>color</i></b> (or <b><i>value</i></b>)</td></tr>
<tr><td><b>/N <i>n</i></a></td><td>Do not perform a CRLF when done.</td></tr>
<tr><td><i>tba</i></td><td><i>(Under development, to be announced)</i></td></tr>
</table>
* * *
#### vgotoxy ######
TBA
* * *
#### vecho ######
TBA
* * *
#### vframe ######
TBA
* * *
#### vinfo ######
TBA
* * *
#### vline ######
TBA
* * *
#### vmode ######
TBA
* * *
#### vpause ######
TBA
* * *
#### vpcspkr ######
TBA
* * *
#### vprogress ######
TBA
* * *
#### vview ######
TBA
