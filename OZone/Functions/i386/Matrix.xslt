﻿<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
	version="1.0"
	xmlns="http://metalx.org/Program"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:var="http://metalx.org/Variable"
	xmlns:matrix="http://metalx.org/i386/Functions/Matrix"
	xmlns:float="http://metalx.org/i386/Functions/Float"
	xmlns:cat="http://metalx.org/i386/Functions/Catalog"
	xmlns:obj="http://metalx.org/i386/Functions/Object"
	xmlns:str="http://metalx.org/i386/Functions/String"
	xmlns:lst="http://metalx.org/i386/Functions/List"
	xmlns:sys="http://metalx.org/i386/Functions/System"
	xmlns:mm="http://metalx.org/i386/Functions/MemoryManager"
	xmlns:asc="http://metalx.org/Ansi/Ascii"
	xmlns:ari="http://metalx.org/Intel/80386/Arithmetic"
	xmlns:imm="http://metalx.org/Intel/80386/Immediate"
	xmlns:inc="http://metalx.org/Intel/80386/Increment"
	xmlns:math="http://metalx.org/Intel/80386/Math"
	xmlns:cpu="http://metalx.org/Intel/80386/Operators"
	xmlns:op="http://metalx.org/Intel/80386/Operands"
	xmlns:fpu="http://metalx.org/Intel/80386/FpuOperators">

	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="matrix:CreateObject">
		<scope>
			<cpu:PushSIToStack/>

			<sys:GetCatalog/>

			<cpu:CopyImmediateToDI/>
			<addressOf ref="matrixClassName" type="Absolute32"/>

			<cat:FindType/>

			<cpu:CopyRegisterToOperand/>
			<op:SI-BXRegister/>

			<cpu:PullDIFromStack/>

			<cpu:CopyImmediateToAX/>
			<int>64</int>

			<obj:Create/>

			<cpu:JumpToRelative8/>
			<addressOf ref="end" type="Relative8"/>
			
			<var:string id="matrixClassName">http://metalx.org/Video/Graphics/Matrix</var:string>

			<label id="end"/>
		</scope>
	</xsl:template>

	<xsl:template match="matrix:Multiply">
		<scope>
			<fpu:ResetFpu/>

			<!--M11-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>00</hex>


			<!--M12-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>04</hex>


			<!--M13-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>08</hex>


			<!--M14-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>0c</hex>


			<!--M21-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>10</hex>


			<!--M22-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>14</hex>


			<!--M23-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>18</hex>


			<!--M24-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>1c</hex>


			<!--M31-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>20</hex>


			<!--M32-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>24</hex>


			<!--M33-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>28</hex>


			<!--M34-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>2c</hex>


			<!--M41-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>00</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>10</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>20</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>30</hex>


			<!--M42-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>04</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>14</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>24</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>34</hex>


			<!--M43-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>08</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>18</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>28</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>38</hex>


			<!--M44-->
			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>30</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>0c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>34</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>1c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>38</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>2c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PushFloatAtAXAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:PushFloatAtSIAddressPlusImmediate8ToST0/>
			<hex>3c</hex>

			<fpu:MultiplyST1ByST0AndIncrementST/>

			<fpu:AddST0ToST1AndIncrementST/>

			<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
			<hex>3c</hex>

			<cpu:WaitForFloatingPointUnit/>
		</scope>
	</xsl:template>

	<xsl:template match="matrix:RotateZ">
		<fpu:PushST0/>

		<fpu:Cosine/>

		<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
		<byte>0</byte>

		<fpu:PushST0/>

		<fpu:Sine/>

		<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
		<byte>4</byte>

		<fpu:PushST0/>

		<fpu:Sine/>

		<fpu:ChangeSign/>

		<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
		<byte>16</byte>

		<fpu:Cosine/>

		<fpu:PullFloatAtDIAddressPlusImmediate8FromST0/>
		<byte>20</byte>

		<cpu:WaitForFloatingPointUnit/>
	</xsl:template>
	
	<xsl:template match="matrix:ToString">
		<scope>
			<str:Create length="40"/>

			<cpu:PushDIToStack/>

			<float:ToString/>

			<cpu:CopyRegisterToOperand/>
			<op:DI-SIRegister/>

			<cpu:PullDIFromStack/>
			<cpu:PushDIToStack/>

			<str:AppendString/>

			<cpu:PullSIFromStack/>
			<cpu:PushSIToStack/>

			<str:AppendCharacter value=","/>

			<float:ToString/>

			<cpu:CopyRegisterToOperand/>
			<op:DI-SIRegister/>

			<cpu:PullDIFromStack/>
			<cpu:PushDIToStack/>

			<str:AppendString/>

			<cpu:PullDIFromStack/>
		</scope>
	</xsl:template>
</xsl:stylesheet>
