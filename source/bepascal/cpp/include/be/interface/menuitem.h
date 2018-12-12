/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere

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

#ifndef _MENUITEM_H_
#define _MENUITEM_H_

#include <Menu.h>
#include <MenuItem.h>
#include <beobj.h>

class BPMenuItem : public BMenuItem, virtual public BPasObject
{
	public:
		BPMenuItem(TPasObject PasObject, const char *label, BMessage *message, char shortcut = 0, uint32 modifiers = 0); 
		BPMenuItem(TPasObject PasObject, BMenu *submenu, BMessage *message = NULL);
		BPMenuItem(TPasObject PasObejct, BMessage *data);
		virtual void Draw(void);
		virtual void DrawContent(void);		
		virtual void GetContentSize(float *width, float *height); 
		virtual void TruncateLabel(float max, char *new_label); 
		virtual void Highlight(bool on); 
                bool IsSelected() const; 
                BPoint ContentLocation() const;		
	private:
};

class BPSeparatorItem : public BSeparatorItem, virtual public BPMenuItem
{
	public:
		BPSeparatorItem(TPasObject PasObject);
		BPSeparatorItem(TPasObject PasObject, BMessage *data);
		virtual void Draw(void);		
		virtual void DrawContent(void);		
};

#endif /* _MENUITEM_H_ */
