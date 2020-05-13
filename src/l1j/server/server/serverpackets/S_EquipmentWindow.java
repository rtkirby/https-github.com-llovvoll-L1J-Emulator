/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * http://www.gnu.org/copyleft/gpl.html
 */
package l1j.server.server.serverpackets;

import l1j.server.server.encryptions.Opcodes;
import l1j.server.server.model.Instance.L1PcInstance;

public class S_EquipmentWindow extends ServerBasePacket {

	private static final String S_EQUIPMENTWINDOWS = "[S] S_EquipmentWindow";

	private byte[] _byte = null;

	public static final byte EQUIPMENT_INDEX_HELM = 1;
	public static final byte EQUIPMENT_INDEX_ARMOR = 3;
	public static final byte EQUIPMENT_INDEX_T = 2;
	public static final byte EQUIPMENT_INDEX_CLOAK = 4;
	public static final byte EQUIPMENT_INDEX_BOOTS = 5;
	public static final byte EQUIPMENT_INDEX_GLOVE = 6;
	public static final byte EQUIPMENT_INDEX_SHIELD = 7;
	public static final byte EQUIPMENT_INDEX_WEAPON = 8;
	public static final byte EQUIPMENT_INDEX_AMULET = 10;
	public static final byte EQUIPMENT_INDEX_BELT = 11;
	public static final byte EQUIPMENT_INDEX_EARRING = 12;
	public static final byte EQUIPMENT_INDEX_RING1 = 18;
	public static final byte EQUIPMENT_INDEX_RING2 = 19;
	public static final byte EQUIPMENT_INDEX_RING3 = 20;
	public static final byte EQUIPMENT_INDEX_RING4 = 21;
	public static final byte EQUIPMENT_INDEX_RUNE1 = 22;
	public static final byte EQUIPMENT_INDEX_RUNE2 = 23;
	public static final byte EQUIPMENT_INDEX_RUNE3 = 24;
	public static final byte EQUIPMENT_INDEX_RUNE4 = 25;
	public static final byte EQUIPMENT_INDEX_RUNE5 = 26;

	public S_EquipmentWindow(L1PcInstance pc, int itemObjId, int index, boolean isEq) {
		writeC(Opcodes.S_OPCODE_CHARRESET);
		writeC(0x42);
		writeD(itemObjId);
		writeC(index);
		if(isEq) {
			writeC(0x01);//TODO 1:Equip(0x01=1)
		} else {
			writeC(0x00);//TODO 0:Unequip(0x00=0)
		}
	}

	@Override
	public byte[] getContent() {
		if (_byte == null) {
			_byte = getBytes();
		}
		return _byte;
	}

	@Override
	public String getType() {
		return S_EQUIPMENTWINDOWS;
	}
}