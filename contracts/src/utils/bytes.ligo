(* Byte utilities *)

#include "math.ligo"

function byteToBase10_001f (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0x00 then res := 0 else skip;
    if b = 0x01 then res := 1 else skip;
    if b = 0x02 then res := 2 else skip;
    if b = 0x03 then res := 3 else skip;
    if b = 0x04 then res := 4 else skip;
    if b = 0x05 then res := 5 else skip;
    if b = 0x06 then res := 6 else skip;
    if b = 0x07 then res := 7 else skip;
    if b = 0x08 then res := 8 else skip;
    if b = 0x09 then res := 9 else skip;
    if b = 0x0a then res := 10 else skip;
    if b = 0x0b then res := 11 else skip;
    if b = 0x0c then res := 12 else skip;
    if b = 0x0d then res := 13 else skip;
    if b = 0x0e then res := 14 else skip;
    if b = 0x0f then res := 15 else skip;
    if b = 0x10 then res := 16 else skip;
    if b = 0x11 then res := 17 else skip;
    if b = 0x12 then res := 18 else skip;
    if b = 0x13 then res := 19 else skip;
    if b = 0x14 then res := 20 else skip;
    if b = 0x15 then res := 21 else skip;
    if b = 0x16 then res := 22 else skip;
    if b = 0x17 then res := 23 else skip;
    if b = 0x18 then res := 24 else skip;
    if b = 0x19 then res := 25 else skip;
    if b = 0x1a then res := 26 else skip;
    if b = 0x1b then res := 27 else skip;
    if b = 0x1c then res := 28 else skip;
    if b = 0x1d then res := 29 else skip;
    if b = 0x1e then res := 30 else skip;
    if b = 0x1f then res := 31 else skip;
  } with res

function byteToBase10_203f (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0x20 then res := 32 else skip;
    if b = 0x21 then res := 33 else skip;
    if b = 0x22 then res := 34 else skip;
    if b = 0x23 then res := 35 else skip;
    if b = 0x24 then res := 36 else skip;
    if b = 0x25 then res := 37 else skip;
    if b = 0x26 then res := 38 else skip;
    if b = 0x27 then res := 39 else skip;
    if b = 0x28 then res := 40 else skip;
    if b = 0x29 then res := 41 else skip;
    if b = 0x2a then res := 42 else skip;
    if b = 0x2b then res := 43 else skip;
    if b = 0x2c then res := 44 else skip;
    if b = 0x2d then res := 45 else skip;
    if b = 0x2e then res := 46 else skip;
    if b = 0x2f then res := 47 else skip;
    if b = 0x30 then res := 48 else skip;
    if b = 0x31 then res := 49 else skip;
    if b = 0x32 then res := 50 else skip;
    if b = 0x33 then res := 51 else skip;
    if b = 0x34 then res := 52 else skip;
    if b = 0x35 then res := 53 else skip;
    if b = 0x36 then res := 54 else skip;
    if b = 0x37 then res := 55 else skip;
    if b = 0x38 then res := 56 else skip;
    if b = 0x39 then res := 57 else skip;
    if b = 0x3a then res := 58 else skip;
    if b = 0x3b then res := 59 else skip;
    if b = 0x3c then res := 60 else skip;
    if b = 0x3d then res := 61 else skip;
    if b = 0x3e then res := 62 else skip;
    if b = 0x3f then res := 63 else skip;
  } with res

function byteToBase10_405f (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0x40 then res := 64 else skip;
    if b = 0x41 then res := 65 else skip;
    if b = 0x42 then res := 66 else skip;
    if b = 0x43 then res := 67 else skip;
    if b = 0x44 then res := 68 else skip;
    if b = 0x45 then res := 69 else skip;
    if b = 0x46 then res := 70 else skip;
    if b = 0x47 then res := 71 else skip;
    if b = 0x48 then res := 72 else skip;
    if b = 0x49 then res := 73 else skip;
    if b = 0x4a then res := 74 else skip;
    if b = 0x4b then res := 75 else skip;
    if b = 0x4c then res := 76 else skip;
    if b = 0x4d then res := 77 else skip;
    if b = 0x4e then res := 78 else skip;
    if b = 0x4f then res := 79 else skip;
    if b = 0x50 then res := 80 else skip;
    if b = 0x51 then res := 81 else skip;
    if b = 0x52 then res := 82 else skip;
    if b = 0x53 then res := 83 else skip;
    if b = 0x54 then res := 84 else skip;
    if b = 0x55 then res := 85 else skip;
    if b = 0x56 then res := 86 else skip;
    if b = 0x57 then res := 87 else skip;
    if b = 0x58 then res := 88 else skip;
    if b = 0x59 then res := 89 else skip;
    if b = 0x5a then res := 90 else skip;
    if b = 0x5b then res := 91 else skip;
    if b = 0x5c then res := 92 else skip;
    if b = 0x5d then res := 93 else skip;
    if b = 0x5e then res := 94 else skip;
    if b = 0x5f then res := 95 else skip;
  } with res

function byteToBase10_607f (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0x60 then res := 96 else skip;
    if b = 0x61 then res := 97 else skip;
    if b = 0x62 then res := 98 else skip;
    if b = 0x63 then res := 99 else skip;
    if b = 0x64 then res := 100 else skip;
    if b = 0x65 then res := 101 else skip;
    if b = 0x66 then res := 102 else skip;
    if b = 0x67 then res := 103 else skip;
    if b = 0x68 then res := 104 else skip;
    if b = 0x69 then res := 105 else skip;
    if b = 0x6a then res := 106 else skip;
    if b = 0x6b then res := 107 else skip;
    if b = 0x6c then res := 108 else skip;
    if b = 0x6d then res := 109 else skip;
    if b = 0x6e then res := 110 else skip;
    if b = 0x6f then res := 111 else skip;
    if b = 0x70 then res := 112 else skip;
    if b = 0x71 then res := 113 else skip;
    if b = 0x72 then res := 114 else skip;
    if b = 0x73 then res := 115 else skip;
    if b = 0x74 then res := 116 else skip;
    if b = 0x75 then res := 117 else skip;
    if b = 0x76 then res := 118 else skip;
    if b = 0x77 then res := 119 else skip;
    if b = 0x78 then res := 120 else skip;
    if b = 0x79 then res := 121 else skip;
    if b = 0x7a then res := 122 else skip;
    if b = 0x7b then res := 123 else skip;
    if b = 0x7c then res := 124 else skip;
    if b = 0x7d then res := 125 else skip;
    if b = 0x7e then res := 126 else skip;
    if b = 0x7f then res := 127 else skip;
  } with res

function byteToBase10_809f (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0x80 then res := 128 else skip;
    if b = 0x81 then res := 129 else skip;
    if b = 0x82 then res := 130 else skip;
    if b = 0x83 then res := 131 else skip;
    if b = 0x84 then res := 132 else skip;
    if b = 0x85 then res := 133 else skip;
    if b = 0x86 then res := 134 else skip;
    if b = 0x87 then res := 135 else skip;
    if b = 0x88 then res := 136 else skip;
    if b = 0x89 then res := 137 else skip;
    if b = 0x8a then res := 138 else skip;
    if b = 0x8b then res := 139 else skip;
    if b = 0x8c then res := 140 else skip;
    if b = 0x8d then res := 141 else skip;
    if b = 0x8e then res := 142 else skip;
    if b = 0x8f then res := 143 else skip;
    if b = 0x90 then res := 144 else skip;
    if b = 0x91 then res := 145 else skip;
    if b = 0x92 then res := 146 else skip;
    if b = 0x93 then res := 147 else skip;
    if b = 0x94 then res := 148 else skip;
    if b = 0x95 then res := 149 else skip;
    if b = 0x96 then res := 150 else skip;
    if b = 0x97 then res := 151 else skip;
    if b = 0x98 then res := 152 else skip;
    if b = 0x99 then res := 153 else skip;
    if b = 0x9a then res := 154 else skip;
    if b = 0x9b then res := 155 else skip;
    if b = 0x9c then res := 156 else skip;
    if b = 0x9d then res := 157 else skip;
    if b = 0x9e then res := 158 else skip;
    if b = 0x9f then res := 159 else skip;
  } with res

function byteToBase10_a0bf (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0xa0 then res := 160 else skip;
    if b = 0xa1 then res := 161 else skip;
    if b = 0xa2 then res := 162 else skip;
    if b = 0xa3 then res := 163 else skip;
    if b = 0xa4 then res := 164 else skip;
    if b = 0xa5 then res := 165 else skip;
    if b = 0xa6 then res := 166 else skip;
    if b = 0xa7 then res := 167 else skip;
    if b = 0xa8 then res := 168 else skip;
    if b = 0xa9 then res := 169 else skip;
    if b = 0xaa then res := 170 else skip;
    if b = 0xab then res := 171 else skip;
    if b = 0xac then res := 172 else skip;
    if b = 0xad then res := 173 else skip;
    if b = 0xae then res := 174 else skip;
    if b = 0xaf then res := 175 else skip;
    if b = 0xb0 then res := 176 else skip;
    if b = 0xb1 then res := 177 else skip;
    if b = 0xb2 then res := 178 else skip;
    if b = 0xb3 then res := 179 else skip;
    if b = 0xb4 then res := 180 else skip;
    if b = 0xb5 then res := 181 else skip;
    if b = 0xb6 then res := 182 else skip;
    if b = 0xb7 then res := 183 else skip;
    if b = 0xb8 then res := 184 else skip;
    if b = 0xb9 then res := 185 else skip;
    if b = 0xba then res := 186 else skip;
    if b = 0xbb then res := 187 else skip;
    if b = 0xbc then res := 188 else skip;
    if b = 0xbd then res := 189 else skip;
    if b = 0xbe then res := 190 else skip;
    if b = 0xbf then res := 191 else skip;
  } with res

function byteToBase10_c0df (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0xc0 then res := 192 else skip;
    if b = 0xc1 then res := 193 else skip;
    if b = 0xc2 then res := 194 else skip;
    if b = 0xc3 then res := 195 else skip;
    if b = 0xc4 then res := 196 else skip;
    if b = 0xc5 then res := 197 else skip;
    if b = 0xc6 then res := 198 else skip;
    if b = 0xc7 then res := 199 else skip;
    if b = 0xc8 then res := 200 else skip;
    if b = 0xc9 then res := 201 else skip;
    if b = 0xca then res := 202 else skip;
    if b = 0xcb then res := 203 else skip;
    if b = 0xcc then res := 204 else skip;
    if b = 0xcd then res := 205 else skip;
    if b = 0xce then res := 206 else skip;
    if b = 0xcf then res := 207 else skip;
    if b = 0xd0 then res := 208 else skip;
    if b = 0xd1 then res := 209 else skip;
    if b = 0xd2 then res := 210 else skip;
    if b = 0xd3 then res := 211 else skip;
    if b = 0xd4 then res := 212 else skip;
    if b = 0xd5 then res := 213 else skip;
    if b = 0xd6 then res := 214 else skip;
    if b = 0xd7 then res := 215 else skip;
    if b = 0xd8 then res := 216 else skip;
    if b = 0xd9 then res := 217 else skip;
    if b = 0xda then res := 218 else skip;
    if b = 0xdb then res := 219 else skip;
    if b = 0xdc then res := 220 else skip;
    if b = 0xdd then res := 221 else skip;
    if b = 0xde then res := 222 else skip;
    if b = 0xdf then res := 223 else skip;
  } with res

function byteToBase10_e0ff (const b : bytes) : int is
  block {
    var res : int := 0;
    if b = 0xe0 then res := 224 else skip;
    if b = 0xe1 then res := 225 else skip;
    if b = 0xe2 then res := 226 else skip;
    if b = 0xe3 then res := 227 else skip;
    if b = 0xe4 then res := 228 else skip;
    if b = 0xe5 then res := 229 else skip;
    if b = 0xe6 then res := 230 else skip;
    if b = 0xe7 then res := 231 else skip;
    if b = 0xe8 then res := 232 else skip;
    if b = 0xe9 then res := 233 else skip;
    if b = 0xea then res := 234 else skip;
    if b = 0xeb then res := 235 else skip;
    if b = 0xec then res := 236 else skip;
    if b = 0xed then res := 237 else skip;
    if b = 0xee then res := 238 else skip;
    if b = 0xef then res := 239 else skip;
    if b = 0xf0 then res := 240 else skip;
    if b = 0xf1 then res := 241 else skip;
    if b = 0xf2 then res := 242 else skip;
    if b = 0xf3 then res := 243 else skip;
    if b = 0xf4 then res := 244 else skip;
    if b = 0xf5 then res := 245 else skip;
    if b = 0xf6 then res := 246 else skip;
    if b = 0xf7 then res := 247 else skip;
    if b = 0xf8 then res := 248 else skip;
    if b = 0xf9 then res := 249 else skip;
    if b = 0xfa then res := 250 else skip;
    if b = 0xfb then res := 251 else skip;
    if b = 0xfc then res := 252 else skip;
    if b = 0xfd then res := 253 else skip;
    if b = 0xfe then res := 254 else skip;
    if b = 0xff then res := 255 else skip;
  } with res

function byteToBase10 (const b : bytes) : int is
  block {
    var res : int := 0;
    if b >= 0x00 and b <= 0x1f then res := byteToBase10_001f(b) else skip;
    if b >= 0x20 and b <= 0x3f then res := byteToBase10_203f(b) else skip;
    if b >= 0x40 and b <= 0x5f then res := byteToBase10_405f(b) else skip;
    if b >= 0x60 and b <= 0x7f then res := byteToBase10_607f(b) else skip;
    if b >= 0x80 and b <= 0x9f then res := byteToBase10_809f(b) else skip;
    if b >= 0xa0 and b <= 0xbf then res := byteToBase10_a0bf(b) else skip;
    if b >= 0xc0 and b <= 0xdf then res := byteToBase10_c0df(b) else skip;
    if b >= 0xe0 and b <= 0xff then res := byteToBase10_e0ff(b) else skip;
  } with res

(* Convert byte array to integer *)
function bytes_to_int (const b : bytes) : int is
  block {
    var res : int := 0;
    var i : nat := 0n;
    const n : nat = Bytes.length(b);
    var exp : int := (n - 1) * 2;
    while i < n block {
      const b10 : int = byteToBase10(Bytes.sub(i, 1n, b)) * int_pow(16, exp);
      res := res + b10;
      i := i + 1n;
      exp := exp - 2;
    };
  } with res
