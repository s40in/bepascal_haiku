/*  BePascal - A pascal wrapper around the BeOS API                             
    Copyright (C) 2002 Olivier Coursiere                                        
                       Eric Jourde                                              
                                                                                
    This library is free software; you can redistribute it and/or               
    modify it under the terms of the GNU Library General Public                 
    License as published by the Free Software Foundation; either                
    version 2 of the License, or (at your option) any later version.            
                                                                                
    This library is distributed in the hope that it will be useful,             
    but WITHOUT ANY WARRANTY; without even the implied warranty of              
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU           
    Library General Public License for more details.                            
                                                                                
    You should have received a copy of the GNU Library General Public           
    License along with this library; if not, write to the Free                  
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   
*/                   
#ifndef _STOPWATCH_CPP_
#define _STOPWATCH_CPP_

#include <beobj.h>
#include <StopWatch.h>

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BStopWatch::BStopWatch
 *  Params: const char *name, bool silent
 * Effects: 
 ***********************************************************************/
TCPlusObject BStopWatch_Create(const char *name, bool silent)
{
	return new BStopWatch(name, silent);
}


/***********************************************************************
 *  Method: BStopWatch::~BStopWatch
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BStopWatch_Free(BStopWatch *StopWatch)
{
   delete StopWatch;
}


/***********************************************************************
 *  Method: BStopWatch::Suspend
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStopWatch_Suspend(BStopWatch *StopWatch)
{
   StopWatch->Suspend();
}


/***********************************************************************
 *  Method: BStopWatch::Resume
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStopWatch_Resume(BStopWatch *StopWatch)
{
   StopWatch->Resume();
}


/***********************************************************************
 *  Method: BStopWatch::Lap
 *  Params: 
 * Returns: bigtime_t
 * Effects: 
 ***********************************************************************/
bigtime_t
BStopWatch_Lap(BStopWatch *StopWatch)
{
   return StopWatch->Lap();
}


/***********************************************************************
 *  Method: BStopWatch::ElapsedTime
 *  Params: 
 * Returns: bigtime_t
 * Effects: 
 ***********************************************************************/
bigtime_t
BStopWatch_ElapsedTime(BStopWatch *StopWatch)
{
   return StopWatch->ElapsedTime();
}


/***********************************************************************
 *  Method: BStopWatch::Reset
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStopWatch_Reset(BStopWatch *StopWatch)
{
   StopWatch->Reset();
}


/***********************************************************************
 *  Method: BStopWatch::Name
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BStopWatch_Name(BStopWatch *StopWatch)
{
   return StopWatch->Name();
}


/***********************************************************************
 *  Method: BStopWatch::_ReservedStopWatch1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BStopWatch__ReservedStopWatch1(BStopWatch *StopWatch)
{
   StopWatch->_ReservedStopWatch1();
}
*/

/***********************************************************************
 *  Method: BStopWatch::_ReservedStopWatch2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BStopWatch__ReservedStopWatch2(BStopWatch *StopWatch)
{
   StopWatch->_ReservedStopWatch2();
}
*/

/***********************************************************************
 *  Method: BStopWatch::BStopWatch
 *  Params: const BStopWatch &
 * Effects: 
 ***********************************************************************/
/*TCPlusObject BStopWatch_Create(TPasObject PasObject, const BStopWatch &)
{
	return new BPStopWatch(PasObject, );
}
*/

/***********************************************************************
 *  Method: BStopWatch::operator=
 *  Params: const BStopWatch &
 * Returns: BStopWatch &
 * Effects: 
 ***********************************************************************/
/*BStopWatch &
BStopWatch_operator=(BStopWatch *StopWatch, const BStopWatch &)
{
   return StopWatch->operator=();
}
*/

#if defined(__cplusplus)
}
#endif

#endif /* _STOPWATCH_CPP_ */
