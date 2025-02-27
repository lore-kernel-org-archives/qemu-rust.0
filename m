Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnh1j-0000H7-GC
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 11:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1J-0008QU-P3
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1B-0007oT-OB
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740674748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZiamQduyCHc+rhmzN6lJTOwulc/JY5H/o8bceqYtxQ=;
 b=Oo0iLLRKfqfGfWkglv2fOL2kD8cwnTKmvCrpqBXYlYZ33SahKhOQPi+5XDsc6O5Zm0heEM
 dUlpsMg1NiCSGLwmz2TX+WnzBoWj4dOCYgr9QKNhKeMx/J9LFsCF+DDboCFlLH5sxF5R1f
 q4Uu8pwtHBY8RvKpMzML1mwlHarSR0U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-rZJjLDe2MBmVZAaHiTu9Tw-1; Thu, 27 Feb 2025 11:45:47 -0500
X-MC-Unique: rZJjLDe2MBmVZAaHiTu9Tw-1
X-Mimecast-MFC-AGG-ID: rZJjLDe2MBmVZAaHiTu9Tw_1740674746
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5e4becb4582so1138869a12.3
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 08:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740674745; x=1741279545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZiamQduyCHc+rhmzN6lJTOwulc/JY5H/o8bceqYtxQ=;
 b=e4WfDoldtfsoEdwvE4CM05xhpC2tGnlBmhN75IZEHsh11crm2E7JbTPhmVmHHgTSvn
 EJnfQLrB8B4W3ZKOz3olcLDn+PgfWTs8uc1dDKNsB9hG4Tu601AP2hWcO93qvcQG5+kz
 /3vjJ9o/Cc8gHljubzc8ZXS1oXomIAkytWytYC2tAVQwzCAQ72zZHOa/lv3xzhkgs97c
 3xGeQR0clW+GfRa7qH2rDjI1vHwR8i9X/+lj/0Dd3NcjGsEiIG85JkW+gZo406oLFbag
 hn8lMoaVc1njQRNJGR2b/mSBH64uRaKmsZaxxBf3dKHDBGlHIB6xfPwiGBFlIqJ8bnbY
 dyRw==
X-Gm-Message-State: AOJu0Yxq141FQVXe8TXmHtoIWcChkB7X/wOD02G6QLaJIveI//bffpt7
 klY4fhQAkHFP6eeRpP190kwJExhHJWv8QF7upxYq0/pkRLzYdPh404TGbOcPFWyJEjqMI18Y+BN
 lkusryMdZCm127nsKg3GME7LFLNlNISpOWr8JzV89AJg25ozQmCeHI58CpkzXuw==
X-Gm-Gg: ASbGncveyVX/bAuTyXReEAd7BHhd4PLsHAzYdOP5XwVbQuupd6bZd3w6NGid6Iynbbg
 bDnBWNY/q09Gq33nwTNGGiL8CmhpoXMAJqSH45i7LIbRZUekX8dnoQLkvah6/+oQEHroGAXFZRi
 3b00yCtG1YZFPEOsjXPKeFL2Dczm8Ha2WszU4ejBhIJoem4cRQPmMHiYVlImVWVtqgN7PkSyd21
 AtuhPVn5F9356MguHbAWXiism3JDuWWbkuLZMIGhzMFGnBx9KNhkmnSzvJm/0hmlON4tkmjLC8b
 xBkDP6myVbuWBxUGGA==
X-Received: by 2002:a17:907:c28:b0:abf:19ac:784 with SMTP id
 a640c23a62f3a-abf261f58a5mr15292866b.33.1740674743926; 
 Thu, 27 Feb 2025 08:45:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp2WZ9FEKoGwMGA7Z70vNSANNEO+lI5FXFMrucI5QXBbbG5LbFAH04KuFcV8K7cI57ULObkQ==
X-Received: by 2002:a17:907:c28:b0:abf:19ac:784 with SMTP id
 a640c23a62f3a-abf261f58a5mr15285066b.33.1740674742566; 
 Thu, 27 Feb 2025 08:45:42 -0800 (PST)
Received: from [192.168.1.84] ([93.56.163.127])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c101415sm148462066b.81.2025.02.27.08.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:45:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/5] rust: pl011: move register definitions out of lib.rs
Date: Thu, 27 Feb 2025 17:45:31 +0100
Message-ID: <20250227164538.814576-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227164538.814576-1-pbonzini@redhat.com>
References: <20250227164538.814576-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A2z6R50GX29VIXY1sMYO-RG6QM18Eysi-fjHPqgVlTk_1740674746
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2025 16:46:12 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs    |   7 +-
 rust/hw/char/pl011/src/lib.rs       | 509 +---------------------------
 rust/hw/char/pl011/src/registers.rs | 507 +++++++++++++++++++++++++++
 3 files changed, 513 insertions(+), 510 deletions(-)
 create mode 100644 rust/hw/char/pl011/src/registers.rs

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index d0857b470c9..01540654cc9 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -26,10 +26,13 @@
 
 use crate::{
     device_class,
-    registers::{self, Interrupt},
-    RegisterOffset,
+    registers::{self, Interrupt, RegisterOffset},
 };
 
+// TODO: You must disable the UART before any of the control registers are
+// reprogrammed. When the UART is disabled in the middle of transmission or
+// reception, it completes the current character before stopping
+
 /// Integer Baud Rate Divider, `UARTIBRD`
 const IBRD_MASK: u32 = 0xffff;
 
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index 1bf46c65af2..45c13ba899e 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -18,516 +18,9 @@
 
 mod device;
 mod device_class;
+mod registers;
 
 pub use device::pl011_create;
 
 pub const TYPE_PL011: &::std::ffi::CStr = c_str!("pl011");
 pub const TYPE_PL011_LUMINARY: &::std::ffi::CStr = c_str!("pl011_luminary");
-
-/// Offset of each register from the base memory address of the device.
-///
-/// # Source
-/// ARM DDI 0183G, Table 3-1 p.3-3
-#[doc(alias = "offset")]
-#[allow(non_camel_case_types)]
-#[repr(u64)]
-#[derive(Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
-enum RegisterOffset {
-    /// Data Register
-    ///
-    /// A write to this register initiates the actual data transmission
-    #[doc(alias = "UARTDR")]
-    DR = 0x000,
-    /// Receive Status Register or Error Clear Register
-    #[doc(alias = "UARTRSR")]
-    #[doc(alias = "UARTECR")]
-    RSR = 0x004,
-    /// Flag Register
-    ///
-    /// A read of this register shows if transmission is complete
-    #[doc(alias = "UARTFR")]
-    FR = 0x018,
-    /// Fractional Baud Rate Register
-    ///
-    /// responsible for baud rate speed
-    #[doc(alias = "UARTFBRD")]
-    FBRD = 0x028,
-    /// `IrDA` Low-Power Counter Register
-    #[doc(alias = "UARTILPR")]
-    ILPR = 0x020,
-    /// Integer Baud Rate Register
-    ///
-    /// Responsible for baud rate speed
-    #[doc(alias = "UARTIBRD")]
-    IBRD = 0x024,
-    /// line control register (data frame format)
-    #[doc(alias = "UARTLCR_H")]
-    LCR_H = 0x02C,
-    /// Toggle UART, transmission or reception
-    #[doc(alias = "UARTCR")]
-    CR = 0x030,
-    /// Interrupt FIFO Level Select Register
-    #[doc(alias = "UARTIFLS")]
-    FLS = 0x034,
-    /// Interrupt Mask Set/Clear Register
-    #[doc(alias = "UARTIMSC")]
-    IMSC = 0x038,
-    /// Raw Interrupt Status Register
-    #[doc(alias = "UARTRIS")]
-    RIS = 0x03C,
-    /// Masked Interrupt Status Register
-    #[doc(alias = "UARTMIS")]
-    MIS = 0x040,
-    /// Interrupt Clear Register
-    #[doc(alias = "UARTICR")]
-    ICR = 0x044,
-    /// DMA control Register
-    #[doc(alias = "UARTDMACR")]
-    DMACR = 0x048,
-    ///// Reserved, offsets `0x04C` to `0x07C`.
-    //Reserved = 0x04C,
-}
-
-mod registers {
-    //! Device registers exposed as typed structs which are backed by arbitrary
-    //! integer bitmaps. [`Data`], [`Control`], [`LineControl`], etc.
-    use bilge::prelude::*;
-    use qemu_api::impl_vmstate_bitsized;
-
-    /// Receive Status Register / Data Register common error bits
-    ///
-    /// The `UARTRSR` register is updated only when a read occurs
-    /// from the `UARTDR` register with the same status information
-    /// that can also be obtained by reading the `UARTDR` register
-    #[bitsize(8)]
-    #[derive(Clone, Copy, Default, DebugBits, FromBits)]
-    pub struct Errors {
-        pub framing_error: bool,
-        pub parity_error: bool,
-        pub break_error: bool,
-        pub overrun_error: bool,
-        _reserved_unpredictable: u4,
-    }
-
-    // TODO: FIFO Mode has different semantics
-    /// Data Register, `UARTDR`
-    ///
-    /// The `UARTDR` register is the data register.
-    ///
-    /// For words to be transmitted:
-    ///
-    /// - if the FIFOs are enabled, data written to this location is pushed onto
-    ///   the transmit
-    /// FIFO
-    /// - if the FIFOs are not enabled, data is stored in the transmitter
-    ///   holding register (the
-    /// bottom word of the transmit FIFO).
-    ///
-    /// The write operation initiates transmission from the UART. The data is
-    /// prefixed with a start bit, appended with the appropriate parity bit
-    /// (if parity is enabled), and a stop bit. The resultant word is then
-    /// transmitted.
-    ///
-    /// For received words:
-    ///
-    /// - if the FIFOs are enabled, the data byte and the 4-bit status (break,
-    ///   frame, parity,
-    /// and overrun) is pushed onto the 12-bit wide receive FIFO
-    /// - if the FIFOs are not enabled, the data byte and status are stored in
-    ///   the receiving
-    /// holding register (the bottom word of the receive FIFO).
-    ///
-    /// The received data byte is read by performing reads from the `UARTDR`
-    /// register along with the corresponding status information. The status
-    /// information can also be read by a read of the `UARTRSR/UARTECR`
-    /// register.
-    ///
-    /// # Note
-    ///
-    /// You must disable the UART before any of the control registers are
-    /// reprogrammed. When the UART is disabled in the middle of
-    /// transmission or reception, it completes the current character before
-    /// stopping.
-    ///
-    /// # Source
-    /// ARM DDI 0183G 3.3.1 Data Register, UARTDR
-    #[bitsize(32)]
-    #[derive(Clone, Copy, Default, DebugBits, FromBits)]
-    #[doc(alias = "UARTDR")]
-    pub struct Data {
-        pub data: u8,
-        pub errors: Errors,
-        _reserved: u16,
-    }
-    impl_vmstate_bitsized!(Data);
-
-    impl Data {
-        // bilge is not very const-friendly, unfortunately
-        pub const BREAK: Self = Self { value: 1 << 10 };
-    }
-
-    // TODO: FIFO Mode has different semantics
-    /// Receive Status Register / Error Clear Register, `UARTRSR/UARTECR`
-    ///
-    /// The UARTRSR/UARTECR register is the receive status register/error clear
-    /// register. Receive status can also be read from the `UARTRSR`
-    /// register. If the status is read from this register, then the status
-    /// information for break, framing and parity corresponds to the
-    /// data character read from the [Data register](Data), `UARTDR` prior to
-    /// reading the UARTRSR register. The status information for overrun is
-    /// set immediately when an overrun condition occurs.
-    ///
-    ///
-    /// # Note
-    /// The received data character must be read first from the [Data
-    /// Register](Data), `UARTDR` before reading the error status associated
-    /// with that data character from the `UARTRSR` register. This read
-    /// sequence cannot be reversed, because the `UARTRSR` register is
-    /// updated only when a read occurs from the `UARTDR` register. However,
-    /// the status information can also be obtained by reading the `UARTDR`
-    /// register
-    ///
-    /// # Source
-    /// ARM DDI 0183G 3.3.2 Receive Status Register/Error Clear Register,
-    /// UARTRSR/UARTECR
-    #[bitsize(32)]
-    #[derive(Clone, Copy, DebugBits, FromBits)]
-    pub struct ReceiveStatusErrorClear {
-        pub errors: Errors,
-        _reserved_unpredictable: u24,
-    }
-    impl_vmstate_bitsized!(ReceiveStatusErrorClear);
-
-    impl ReceiveStatusErrorClear {
-        pub fn set_from_data(&mut self, data: Data) {
-            self.set_errors(data.errors());
-        }
-
-        pub fn reset(&mut self) {
-            // All the bits are cleared to 0 on reset.
-            *self = Self::default();
-        }
-    }
-
-    impl Default for ReceiveStatusErrorClear {
-        fn default() -> Self {
-            0.into()
-        }
-    }
-
-    #[bitsize(32)]
-    #[derive(Clone, Copy, DebugBits, FromBits)]
-    /// Flag Register, `UARTFR`
-    #[doc(alias = "UARTFR")]
-    pub struct Flags {
-        /// CTS Clear to send. This bit is the complement of the UART clear to
-        /// send, `nUARTCTS`, modem status input. That is, the bit is 1
-        /// when `nUARTCTS` is LOW.
-        pub clear_to_send: bool,
-        /// DSR Data set ready. This bit is the complement of the UART data set
-        /// ready, `nUARTDSR`, modem status input. That is, the bit is 1 when
-        /// `nUARTDSR` is LOW.
-        pub data_set_ready: bool,
-        /// DCD Data carrier detect. This bit is the complement of the UART data
-        /// carrier detect, `nUARTDCD`, modem status input. That is, the bit is
-        /// 1 when `nUARTDCD` is LOW.
-        pub data_carrier_detect: bool,
-        /// BUSY UART busy. If this bit is set to 1, the UART is busy
-        /// transmitting data. This bit remains set until the complete
-        /// byte, including all the stop bits, has been sent from the
-        /// shift register. This bit is set as soon as the transmit FIFO
-        /// becomes non-empty, regardless of whether the UART is enabled
-        /// or not.
-        pub busy: bool,
-        /// RXFE Receive FIFO empty. The meaning of this bit depends on the
-        /// state of the FEN bit in the UARTLCR_H register. If the FIFO
-        /// is disabled, this bit is set when the receive holding
-        /// register is empty. If the FIFO is enabled, the RXFE bit is
-        /// set when the receive FIFO is empty.
-        pub receive_fifo_empty: bool,
-        /// TXFF Transmit FIFO full. The meaning of this bit depends on the
-        /// state of the FEN bit in the UARTLCR_H register. If the FIFO
-        /// is disabled, this bit is set when the transmit holding
-        /// register is full. If the FIFO is enabled, the TXFF bit is
-        /// set when the transmit FIFO is full.
-        pub transmit_fifo_full: bool,
-        /// RXFF Receive FIFO full. The meaning of this bit depends on the state
-        /// of the FEN bit in the UARTLCR_H register. If the FIFO is
-        /// disabled, this bit is set when the receive holding register
-        /// is full. If the FIFO is enabled, the RXFF bit is set when
-        /// the receive FIFO is full.
-        pub receive_fifo_full: bool,
-        /// Transmit FIFO empty. The meaning of this bit depends on the state of
-        /// the FEN bit in the [Line Control register](LineControl),
-        /// `UARTLCR_H`. If the FIFO is disabled, this bit is set when the
-        /// transmit holding register is empty. If the FIFO is enabled,
-        /// the TXFE bit is set when the transmit FIFO is empty. This
-        /// bit does not indicate if there is data in the transmit shift
-        /// register.
-        pub transmit_fifo_empty: bool,
-        /// `RI`, is `true` when `nUARTRI` is `LOW`.
-        pub ring_indicator: bool,
-        _reserved_zero_no_modify: u23,
-    }
-    impl_vmstate_bitsized!(Flags);
-
-    impl Flags {
-        pub fn reset(&mut self) {
-            *self = Self::default();
-        }
-    }
-
-    impl Default for Flags {
-        fn default() -> Self {
-            let mut ret: Self = 0.into();
-            // After reset TXFF, RXFF, and BUSY are 0, and TXFE and RXFE are 1
-            ret.set_receive_fifo_empty(true);
-            ret.set_transmit_fifo_empty(true);
-            ret
-        }
-    }
-
-    #[bitsize(32)]
-    #[derive(Clone, Copy, DebugBits, FromBits)]
-    /// Line Control Register, `UARTLCR_H`
-    #[doc(alias = "UARTLCR_H")]
-    pub struct LineControl {
-        /// BRK Send break.
-        ///
-        /// If this bit is set to `1`, a low-level is continually output on the
-        /// `UARTTXD` output, after completing transmission of the
-        /// current character. For the proper execution of the break command,
-        /// the software must set this bit for at least two complete
-        /// frames. For normal use, this bit must be cleared to `0`.
-        pub send_break: bool,
-        /// 1 PEN Parity enable:
-        ///
-        /// - 0 = parity is disabled and no parity bit added to the data frame
-        /// - 1 = parity checking and generation is enabled.
-        ///
-        /// See Table 3-11 on page 3-14 for the parity truth table.
-        pub parity_enabled: bool,
-        /// EPS Even parity select. Controls the type of parity the UART uses
-        /// during transmission and reception:
-        /// - 0 = odd parity. The UART generates or checks for an odd number of
-        ///   1s in the data and parity bits.
-        /// - 1 = even parity. The UART generates or checks for an even number
-        ///   of 1s in the data and parity bits.
-        /// This bit has no effect when the `PEN` bit disables parity checking
-        /// and generation. See Table 3-11 on page 3-14 for the parity
-        /// truth table.
-        pub parity: Parity,
-        /// 3 STP2 Two stop bits select. If this bit is set to 1, two stop bits
-        /// are transmitted at the end of the frame. The receive
-        /// logic does not check for two stop bits being received.
-        pub two_stops_bits: bool,
-        /// FEN Enable FIFOs:
-        /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
-        /// 1-byte-deep holding registers 1 = transmit and receive FIFO
-        /// buffers are enabled (FIFO mode).
-        pub fifos_enabled: Mode,
-        /// WLEN Word length. These bits indicate the number of data bits
-        /// transmitted or received in a frame as follows: b11 = 8 bits
-        /// b10 = 7 bits
-        /// b01 = 6 bits
-        /// b00 = 5 bits.
-        pub word_length: WordLength,
-        /// 7 SPS Stick parity select.
-        /// 0 = stick parity is disabled
-        /// 1 = either:
-        /// • if the EPS bit is 0 then the parity bit is transmitted and checked
-        /// as a 1 • if the EPS bit is 1 then the parity bit is
-        /// transmitted and checked as a 0. This bit has no effect when
-        /// the PEN bit disables parity checking and generation. See Table 3-11
-        /// on page 3-14 for the parity truth table.
-        pub sticky_parity: bool,
-        /// 31:8 - Reserved, do not modify, read as zero.
-        _reserved_zero_no_modify: u24,
-    }
-    impl_vmstate_bitsized!(LineControl);
-
-    impl LineControl {
-        pub fn reset(&mut self) {
-            // All the bits are cleared to 0 when reset.
-            *self = 0.into();
-        }
-    }
-
-    impl Default for LineControl {
-        fn default() -> Self {
-            0.into()
-        }
-    }
-
-    #[bitsize(1)]
-    #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
-    /// `EPS` "Even parity select", field of [Line Control
-    /// register](LineControl).
-    pub enum Parity {
-        /// - 0 = odd parity. The UART generates or checks for an odd number of
-        ///   1s in the data and parity bits.
-        Odd = 0,
-        /// - 1 = even parity. The UART generates or checks for an even number
-        ///   of 1s in the data and parity bits.
-        Even = 1,
-    }
-
-    #[bitsize(1)]
-    #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
-    /// `FEN` "Enable FIFOs" or Device mode, field of [Line Control
-    /// register](LineControl).
-    pub enum Mode {
-        /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
-        /// 1-byte-deep holding registers
-        Character = 0,
-        /// 1 = transmit and receive FIFO buffers are enabled (FIFO mode).
-        FIFO = 1,
-    }
-
-    #[bitsize(2)]
-    #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
-    /// `WLEN` Word length, field of [Line Control register](LineControl).
-    ///
-    /// These bits indicate the number of data bits transmitted or received in a
-    /// frame as follows:
-    pub enum WordLength {
-        /// b11 = 8 bits
-        _8Bits = 0b11,
-        /// b10 = 7 bits
-        _7Bits = 0b10,
-        /// b01 = 6 bits
-        _6Bits = 0b01,
-        /// b00 = 5 bits.
-        _5Bits = 0b00,
-    }
-
-    /// Control Register, `UARTCR`
-    ///
-    /// The `UARTCR` register is the control register. All the bits are cleared
-    /// to `0` on reset except for bits `9` and `8` that are set to `1`.
-    ///
-    /// # Source
-    /// ARM DDI 0183G, 3.3.8 Control Register, `UARTCR`, Table 3-12
-    #[bitsize(32)]
-    #[doc(alias = "UARTCR")]
-    #[derive(Clone, Copy, DebugBits, FromBits)]
-    pub struct Control {
-        /// `UARTEN` UART enable: 0 = UART is disabled. If the UART is disabled
-        /// in the middle of transmission or reception, it completes the current
-        /// character before stopping. 1 = the UART is enabled. Data
-        /// transmission and reception occurs for either UART signals or SIR
-        /// signals depending on the setting of the SIREN bit.
-        pub enable_uart: bool,
-        /// `SIREN` `SIR` enable: 0 = IrDA SIR ENDEC is disabled. `nSIROUT`
-        /// remains LOW (no light pulse generated), and signal transitions on
-        /// SIRIN have no effect. 1 = IrDA SIR ENDEC is enabled. Data is
-        /// transmitted and received on nSIROUT and SIRIN. UARTTXD remains HIGH,
-        /// in the marking state. Signal transitions on UARTRXD or modem status
-        /// inputs have no effect. This bit has no effect if the UARTEN bit
-        /// disables the UART.
-        pub enable_sir: bool,
-        /// `SIRLP` SIR low-power IrDA mode. This bit selects the IrDA encoding
-        /// mode. If this bit is cleared to 0, low-level bits are transmitted as
-        /// an active high pulse with a width of 3/ 16th of the bit period. If
-        /// this bit is set to 1, low-level bits are transmitted with a pulse
-        /// width that is 3 times the period of the IrLPBaud16 input signal,
-        /// regardless of the selected bit rate. Setting this bit uses less
-        /// power, but might reduce transmission distances.
-        pub sir_lowpower_irda_mode: u1,
-        /// Reserved, do not modify, read as zero.
-        _reserved_zero_no_modify: u4,
-        /// `LBE` Loopback enable. If this bit is set to 1 and the SIREN bit is
-        /// set to 1 and the SIRTEST bit in the Test Control register, UARTTCR
-        /// on page 4-5 is set to 1, then the nSIROUT path is inverted, and fed
-        /// through to the SIRIN path. The SIRTEST bit in the test register must
-        /// be set to 1 to override the normal half-duplex SIR operation. This
-        /// must be the requirement for accessing the test registers during
-        /// normal operation, and SIRTEST must be cleared to 0 when loopback
-        /// testing is finished. This feature reduces the amount of external
-        /// coupling required during system test. If this bit is set to 1, and
-        /// the SIRTEST bit is set to 0, the UARTTXD path is fed through to the
-        /// UARTRXD path. In either SIR mode or UART mode, when this bit is set,
-        /// the modem outputs are also fed through to the modem inputs. This bit
-        /// is cleared to 0 on reset, to disable loopback.
-        pub enable_loopback: bool,
-        /// `TXE` Transmit enable. If this bit is set to 1, the transmit section
-        /// of the UART is enabled. Data transmission occurs for either UART
-        /// signals, or SIR signals depending on the setting of the SIREN bit.
-        /// When the UART is disabled in the middle of transmission, it
-        /// completes the current character before stopping.
-        pub enable_transmit: bool,
-        /// `RXE` Receive enable. If this bit is set to 1, the receive section
-        /// of the UART is enabled. Data reception occurs for either UART
-        /// signals or SIR signals depending on the setting of the SIREN bit.
-        /// When the UART is disabled in the middle of reception, it completes
-        /// the current character before stopping.
-        pub enable_receive: bool,
-        /// `DTR` Data transmit ready. This bit is the complement of the UART
-        /// data transmit ready, `nUARTDTR`, modem status output. That is, when
-        /// the bit is programmed to a 1 then `nUARTDTR` is LOW.
-        pub data_transmit_ready: bool,
-        /// `RTS` Request to send. This bit is the complement of the UART
-        /// request to send, `nUARTRTS`, modem status output. That is, when the
-        /// bit is programmed to a 1 then `nUARTRTS` is LOW.
-        pub request_to_send: bool,
-        /// `Out1` This bit is the complement of the UART Out1 (`nUARTOut1`)
-        /// modem status output. That is, when the bit is programmed to a 1 the
-        /// output is 0. For DTE this can be used as Data Carrier Detect (DCD).
-        pub out_1: bool,
-        /// `Out2` This bit is the complement of the UART Out2 (`nUARTOut2`)
-        /// modem status output. That is, when the bit is programmed to a 1, the
-        /// output is 0. For DTE this can be used as Ring Indicator (RI).
-        pub out_2: bool,
-        /// `RTSEn` RTS hardware flow control enable. If this bit is set to 1,
-        /// RTS hardware flow control is enabled. Data is only requested when
-        /// there is space in the receive FIFO for it to be received.
-        pub rts_hardware_flow_control_enable: bool,
-        /// `CTSEn` CTS hardware flow control enable. If this bit is set to 1,
-        /// CTS hardware flow control is enabled. Data is only transmitted when
-        /// the `nUARTCTS` signal is asserted.
-        pub cts_hardware_flow_control_enable: bool,
-        /// 31:16 - Reserved, do not modify, read as zero.
-        _reserved_zero_no_modify2: u16,
-    }
-    impl_vmstate_bitsized!(Control);
-
-    impl Control {
-        pub fn reset(&mut self) {
-            *self = 0.into();
-            self.set_enable_receive(true);
-            self.set_enable_transmit(true);
-        }
-    }
-
-    impl Default for Control {
-        fn default() -> Self {
-            let mut ret: Self = 0.into();
-            ret.reset();
-            ret
-        }
-    }
-
-    /// Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC
-    pub struct Interrupt(pub u32);
-
-    impl Interrupt {
-        pub const OE: Self = Self(1 << 10);
-        pub const BE: Self = Self(1 << 9);
-        pub const PE: Self = Self(1 << 8);
-        pub const FE: Self = Self(1 << 7);
-        pub const RT: Self = Self(1 << 6);
-        pub const TX: Self = Self(1 << 5);
-        pub const RX: Self = Self(1 << 4);
-        pub const DSR: Self = Self(1 << 3);
-        pub const DCD: Self = Self(1 << 2);
-        pub const CTS: Self = Self(1 << 1);
-        pub const RI: Self = Self(1 << 0);
-
-        pub const E: Self = Self(Self::OE.0 | Self::BE.0 | Self::PE.0 | Self::FE.0);
-        pub const MS: Self = Self(Self::RI.0 | Self::DSR.0 | Self::DCD.0 | Self::CTS.0);
-    }
-}
-
-// TODO: You must disable the UART before any of the control registers are
-// reprogrammed. When the UART is disabled in the middle of transmission or
-// reception, it completes the current character before stopping
diff --git a/rust/hw/char/pl011/src/registers.rs b/rust/hw/char/pl011/src/registers.rs
new file mode 100644
index 00000000000..ebd8297ce69
--- /dev/null
+++ b/rust/hw/char/pl011/src/registers.rs
@@ -0,0 +1,507 @@
+// Copyright 2024, Linaro Limited
+// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Device registers exposed as typed structs which are backed by arbitrary
+//! integer bitmaps. [`Data`], [`Control`], [`LineControl`], etc.
+
+use bilge::prelude::*;
+
+use qemu_api::impl_vmstate_bitsized;
+
+/// Offset of each register from the base memory address of the device.
+///
+/// # Source
+/// ARM DDI 0183G, Table 3-1 p.3-3
+#[doc(alias = "offset")]
+#[allow(non_camel_case_types)]
+#[repr(u64)]
+#[derive(Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
+pub enum RegisterOffset {
+    /// Data Register
+    ///
+    /// A write to this register initiates the actual data transmission
+    #[doc(alias = "UARTDR")]
+    DR = 0x000,
+    /// Receive Status Register or Error Clear Register
+    #[doc(alias = "UARTRSR")]
+    #[doc(alias = "UARTECR")]
+    RSR = 0x004,
+    /// Flag Register
+    ///
+    /// A read of this register shows if transmission is complete
+    #[doc(alias = "UARTFR")]
+    FR = 0x018,
+    /// Fractional Baud Rate Register
+    ///
+    /// responsible for baud rate speed
+    #[doc(alias = "UARTFBRD")]
+    FBRD = 0x028,
+    /// `IrDA` Low-Power Counter Register
+    #[doc(alias = "UARTILPR")]
+    ILPR = 0x020,
+    /// Integer Baud Rate Register
+    ///
+    /// Responsible for baud rate speed
+    #[doc(alias = "UARTIBRD")]
+    IBRD = 0x024,
+    /// line control register (data frame format)
+    #[doc(alias = "UARTLCR_H")]
+    LCR_H = 0x02C,
+    /// Toggle UART, transmission or reception
+    #[doc(alias = "UARTCR")]
+    CR = 0x030,
+    /// Interrupt FIFO Level Select Register
+    #[doc(alias = "UARTIFLS")]
+    FLS = 0x034,
+    /// Interrupt Mask Set/Clear Register
+    #[doc(alias = "UARTIMSC")]
+    IMSC = 0x038,
+    /// Raw Interrupt Status Register
+    #[doc(alias = "UARTRIS")]
+    RIS = 0x03C,
+    /// Masked Interrupt Status Register
+    #[doc(alias = "UARTMIS")]
+    MIS = 0x040,
+    /// Interrupt Clear Register
+    #[doc(alias = "UARTICR")]
+    ICR = 0x044,
+    /// DMA control Register
+    #[doc(alias = "UARTDMACR")]
+    DMACR = 0x048,
+    ///// Reserved, offsets `0x04C` to `0x07C`.
+    //Reserved = 0x04C,
+}
+
+/// Receive Status Register / Data Register common error bits
+///
+/// The `UARTRSR` register is updated only when a read occurs
+/// from the `UARTDR` register with the same status information
+/// that can also be obtained by reading the `UARTDR` register
+#[bitsize(8)]
+#[derive(Clone, Copy, Default, DebugBits, FromBits)]
+pub struct Errors {
+    pub framing_error: bool,
+    pub parity_error: bool,
+    pub break_error: bool,
+    pub overrun_error: bool,
+    _reserved_unpredictable: u4,
+}
+
+// TODO: FIFO Mode has different semantics
+/// Data Register, `UARTDR`
+///
+/// The `UARTDR` register is the data register.
+///
+/// For words to be transmitted:
+///
+/// - if the FIFOs are enabled, data written to this location is pushed onto
+///   the transmit
+/// FIFO
+/// - if the FIFOs are not enabled, data is stored in the transmitter
+///   holding register (the
+/// bottom word of the transmit FIFO).
+///
+/// The write operation initiates transmission from the UART. The data is
+/// prefixed with a start bit, appended with the appropriate parity bit
+/// (if parity is enabled), and a stop bit. The resultant word is then
+/// transmitted.
+///
+/// For received words:
+///
+/// - if the FIFOs are enabled, the data byte and the 4-bit status (break,
+///   frame, parity,
+/// and overrun) is pushed onto the 12-bit wide receive FIFO
+/// - if the FIFOs are not enabled, the data byte and status are stored in
+///   the receiving
+/// holding register (the bottom word of the receive FIFO).
+///
+/// The received data byte is read by performing reads from the `UARTDR`
+/// register along with the corresponding status information. The status
+/// information can also be read by a read of the `UARTRSR/UARTECR`
+/// register.
+///
+/// # Note
+///
+/// You must disable the UART before any of the control registers are
+/// reprogrammed. When the UART is disabled in the middle of
+/// transmission or reception, it completes the current character before
+/// stopping.
+///
+/// # Source
+/// ARM DDI 0183G 3.3.1 Data Register, UARTDR
+#[bitsize(32)]
+#[derive(Clone, Copy, Default, DebugBits, FromBits)]
+#[doc(alias = "UARTDR")]
+pub struct Data {
+    pub data: u8,
+    pub errors: Errors,
+    _reserved: u16,
+}
+impl_vmstate_bitsized!(Data);
+
+impl Data {
+    // bilge is not very const-friendly, unfortunately
+    pub const BREAK: Self = Self { value: 1 << 10 };
+}
+
+// TODO: FIFO Mode has different semantics
+/// Receive Status Register / Error Clear Register, `UARTRSR/UARTECR`
+///
+/// The UARTRSR/UARTECR register is the receive status register/error clear
+/// register. Receive status can also be read from the `UARTRSR`
+/// register. If the status is read from this register, then the status
+/// information for break, framing and parity corresponds to the
+/// data character read from the [Data register](Data), `UARTDR` prior to
+/// reading the UARTRSR register. The status information for overrun is
+/// set immediately when an overrun condition occurs.
+///
+///
+/// # Note
+/// The received data character must be read first from the [Data
+/// Register](Data), `UARTDR` before reading the error status associated
+/// with that data character from the `UARTRSR` register. This read
+/// sequence cannot be reversed, because the `UARTRSR` register is
+/// updated only when a read occurs from the `UARTDR` register. However,
+/// the status information can also be obtained by reading the `UARTDR`
+/// register
+///
+/// # Source
+/// ARM DDI 0183G 3.3.2 Receive Status Register/Error Clear Register,
+/// UARTRSR/UARTECR
+#[bitsize(32)]
+#[derive(Clone, Copy, DebugBits, FromBits)]
+pub struct ReceiveStatusErrorClear {
+    pub errors: Errors,
+    _reserved_unpredictable: u24,
+}
+impl_vmstate_bitsized!(ReceiveStatusErrorClear);
+
+impl ReceiveStatusErrorClear {
+    pub fn set_from_data(&mut self, data: Data) {
+        self.set_errors(data.errors());
+    }
+
+    pub fn reset(&mut self) {
+        // All the bits are cleared to 0 on reset.
+        *self = Self::default();
+    }
+}
+
+impl Default for ReceiveStatusErrorClear {
+    fn default() -> Self {
+        0.into()
+    }
+}
+
+#[bitsize(32)]
+#[derive(Clone, Copy, DebugBits, FromBits)]
+/// Flag Register, `UARTFR`
+#[doc(alias = "UARTFR")]
+pub struct Flags {
+    /// CTS Clear to send. This bit is the complement of the UART clear to
+    /// send, `nUARTCTS`, modem status input. That is, the bit is 1
+    /// when `nUARTCTS` is LOW.
+    pub clear_to_send: bool,
+    /// DSR Data set ready. This bit is the complement of the UART data set
+    /// ready, `nUARTDSR`, modem status input. That is, the bit is 1 when
+    /// `nUARTDSR` is LOW.
+    pub data_set_ready: bool,
+    /// DCD Data carrier detect. This bit is the complement of the UART data
+    /// carrier detect, `nUARTDCD`, modem status input. That is, the bit is
+    /// 1 when `nUARTDCD` is LOW.
+    pub data_carrier_detect: bool,
+    /// BUSY UART busy. If this bit is set to 1, the UART is busy
+    /// transmitting data. This bit remains set until the complete
+    /// byte, including all the stop bits, has been sent from the
+    /// shift register. This bit is set as soon as the transmit FIFO
+    /// becomes non-empty, regardless of whether the UART is enabled
+    /// or not.
+    pub busy: bool,
+    /// RXFE Receive FIFO empty. The meaning of this bit depends on the
+    /// state of the FEN bit in the UARTLCR_H register. If the FIFO
+    /// is disabled, this bit is set when the receive holding
+    /// register is empty. If the FIFO is enabled, the RXFE bit is
+    /// set when the receive FIFO is empty.
+    pub receive_fifo_empty: bool,
+    /// TXFF Transmit FIFO full. The meaning of this bit depends on the
+    /// state of the FEN bit in the UARTLCR_H register. If the FIFO
+    /// is disabled, this bit is set when the transmit holding
+    /// register is full. If the FIFO is enabled, the TXFF bit is
+    /// set when the transmit FIFO is full.
+    pub transmit_fifo_full: bool,
+    /// RXFF Receive FIFO full. The meaning of this bit depends on the state
+    /// of the FEN bit in the UARTLCR_H register. If the FIFO is
+    /// disabled, this bit is set when the receive holding register
+    /// is full. If the FIFO is enabled, the RXFF bit is set when
+    /// the receive FIFO is full.
+    pub receive_fifo_full: bool,
+    /// Transmit FIFO empty. The meaning of this bit depends on the state of
+    /// the FEN bit in the [Line Control register](LineControl),
+    /// `UARTLCR_H`. If the FIFO is disabled, this bit is set when the
+    /// transmit holding register is empty. If the FIFO is enabled,
+    /// the TXFE bit is set when the transmit FIFO is empty. This
+    /// bit does not indicate if there is data in the transmit shift
+    /// register.
+    pub transmit_fifo_empty: bool,
+    /// `RI`, is `true` when `nUARTRI` is `LOW`.
+    pub ring_indicator: bool,
+    _reserved_zero_no_modify: u23,
+}
+impl_vmstate_bitsized!(Flags);
+
+impl Flags {
+    pub fn reset(&mut self) {
+        *self = Self::default();
+    }
+}
+
+impl Default for Flags {
+    fn default() -> Self {
+        let mut ret: Self = 0.into();
+        // After reset TXFF, RXFF, and BUSY are 0, and TXFE and RXFE are 1
+        ret.set_receive_fifo_empty(true);
+        ret.set_transmit_fifo_empty(true);
+        ret
+    }
+}
+
+#[bitsize(32)]
+#[derive(Clone, Copy, DebugBits, FromBits)]
+/// Line Control Register, `UARTLCR_H`
+#[doc(alias = "UARTLCR_H")]
+pub struct LineControl {
+    /// BRK Send break.
+    ///
+    /// If this bit is set to `1`, a low-level is continually output on the
+    /// `UARTTXD` output, after completing transmission of the
+    /// current character. For the proper execution of the break command,
+    /// the software must set this bit for at least two complete
+    /// frames. For normal use, this bit must be cleared to `0`.
+    pub send_break: bool,
+    /// 1 PEN Parity enable:
+    ///
+    /// - 0 = parity is disabled and no parity bit added to the data frame
+    /// - 1 = parity checking and generation is enabled.
+    ///
+    /// See Table 3-11 on page 3-14 for the parity truth table.
+    pub parity_enabled: bool,
+    /// EPS Even parity select. Controls the type of parity the UART uses
+    /// during transmission and reception:
+    /// - 0 = odd parity. The UART generates or checks for an odd number of
+    ///   1s in the data and parity bits.
+    /// - 1 = even parity. The UART generates or checks for an even number
+    ///   of 1s in the data and parity bits.
+    /// This bit has no effect when the `PEN` bit disables parity checking
+    /// and generation. See Table 3-11 on page 3-14 for the parity
+    /// truth table.
+    pub parity: Parity,
+    /// 3 STP2 Two stop bits select. If this bit is set to 1, two stop bits
+    /// are transmitted at the end of the frame. The receive
+    /// logic does not check for two stop bits being received.
+    pub two_stops_bits: bool,
+    /// FEN Enable FIFOs:
+    /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
+    /// 1-byte-deep holding registers 1 = transmit and receive FIFO
+    /// buffers are enabled (FIFO mode).
+    pub fifos_enabled: Mode,
+    /// WLEN Word length. These bits indicate the number of data bits
+    /// transmitted or received in a frame as follows: b11 = 8 bits
+    /// b10 = 7 bits
+    /// b01 = 6 bits
+    /// b00 = 5 bits.
+    pub word_length: WordLength,
+    /// 7 SPS Stick parity select.
+    /// 0 = stick parity is disabled
+    /// 1 = either:
+    /// • if the EPS bit is 0 then the parity bit is transmitted and checked
+    /// as a 1 • if the EPS bit is 1 then the parity bit is
+    /// transmitted and checked as a 0. This bit has no effect when
+    /// the PEN bit disables parity checking and generation. See Table 3-11
+    /// on page 3-14 for the parity truth table.
+    pub sticky_parity: bool,
+    /// 31:8 - Reserved, do not modify, read as zero.
+    _reserved_zero_no_modify: u24,
+}
+impl_vmstate_bitsized!(LineControl);
+
+impl LineControl {
+    pub fn reset(&mut self) {
+        // All the bits are cleared to 0 when reset.
+        *self = 0.into();
+    }
+}
+
+impl Default for LineControl {
+    fn default() -> Self {
+        0.into()
+    }
+}
+
+#[bitsize(1)]
+#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+/// `EPS` "Even parity select", field of [Line Control
+/// register](LineControl).
+pub enum Parity {
+    /// - 0 = odd parity. The UART generates or checks for an odd number of
+    ///   1s in the data and parity bits.
+    Odd = 0,
+    /// - 1 = even parity. The UART generates or checks for an even number
+    ///   of 1s in the data and parity bits.
+    Even = 1,
+}
+
+#[bitsize(1)]
+#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+/// `FEN` "Enable FIFOs" or Device mode, field of [Line Control
+/// register](LineControl).
+pub enum Mode {
+    /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
+    /// 1-byte-deep holding registers
+    Character = 0,
+    /// 1 = transmit and receive FIFO buffers are enabled (FIFO mode).
+    FIFO = 1,
+}
+
+#[bitsize(2)]
+#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+/// `WLEN` Word length, field of [Line Control register](LineControl).
+///
+/// These bits indicate the number of data bits transmitted or received in a
+/// frame as follows:
+pub enum WordLength {
+    /// b11 = 8 bits
+    _8Bits = 0b11,
+    /// b10 = 7 bits
+    _7Bits = 0b10,
+    /// b01 = 6 bits
+    _6Bits = 0b01,
+    /// b00 = 5 bits.
+    _5Bits = 0b00,
+}
+
+/// Control Register, `UARTCR`
+///
+/// The `UARTCR` register is the control register. All the bits are cleared
+/// to `0` on reset except for bits `9` and `8` that are set to `1`.
+///
+/// # Source
+/// ARM DDI 0183G, 3.3.8 Control Register, `UARTCR`, Table 3-12
+#[bitsize(32)]
+#[doc(alias = "UARTCR")]
+#[derive(Clone, Copy, DebugBits, FromBits)]
+pub struct Control {
+    /// `UARTEN` UART enable: 0 = UART is disabled. If the UART is disabled
+    /// in the middle of transmission or reception, it completes the current
+    /// character before stopping. 1 = the UART is enabled. Data
+    /// transmission and reception occurs for either UART signals or SIR
+    /// signals depending on the setting of the SIREN bit.
+    pub enable_uart: bool,
+    /// `SIREN` `SIR` enable: 0 = IrDA SIR ENDEC is disabled. `nSIROUT`
+    /// remains LOW (no light pulse generated), and signal transitions on
+    /// SIRIN have no effect. 1 = IrDA SIR ENDEC is enabled. Data is
+    /// transmitted and received on nSIROUT and SIRIN. UARTTXD remains HIGH,
+    /// in the marking state. Signal transitions on UARTRXD or modem status
+    /// inputs have no effect. This bit has no effect if the UARTEN bit
+    /// disables the UART.
+    pub enable_sir: bool,
+    /// `SIRLP` SIR low-power IrDA mode. This bit selects the IrDA encoding
+    /// mode. If this bit is cleared to 0, low-level bits are transmitted as
+    /// an active high pulse with a width of 3/ 16th of the bit period. If
+    /// this bit is set to 1, low-level bits are transmitted with a pulse
+    /// width that is 3 times the period of the IrLPBaud16 input signal,
+    /// regardless of the selected bit rate. Setting this bit uses less
+    /// power, but might reduce transmission distances.
+    pub sir_lowpower_irda_mode: u1,
+    /// Reserved, do not modify, read as zero.
+    _reserved_zero_no_modify: u4,
+    /// `LBE` Loopback enable. If this bit is set to 1 and the SIREN bit is
+    /// set to 1 and the SIRTEST bit in the Test Control register, UARTTCR
+    /// on page 4-5 is set to 1, then the nSIROUT path is inverted, and fed
+    /// through to the SIRIN path. The SIRTEST bit in the test register must
+    /// be set to 1 to override the normal half-duplex SIR operation. This
+    /// must be the requirement for accessing the test registers during
+    /// normal operation, and SIRTEST must be cleared to 0 when loopback
+    /// testing is finished. This feature reduces the amount of external
+    /// coupling required during system test. If this bit is set to 1, and
+    /// the SIRTEST bit is set to 0, the UARTTXD path is fed through to the
+    /// UARTRXD path. In either SIR mode or UART mode, when this bit is set,
+    /// the modem outputs are also fed through to the modem inputs. This bit
+    /// is cleared to 0 on reset, to disable loopback.
+    pub enable_loopback: bool,
+    /// `TXE` Transmit enable. If this bit is set to 1, the transmit section
+    /// of the UART is enabled. Data transmission occurs for either UART
+    /// signals, or SIR signals depending on the setting of the SIREN bit.
+    /// When the UART is disabled in the middle of transmission, it
+    /// completes the current character before stopping.
+    pub enable_transmit: bool,
+    /// `RXE` Receive enable. If this bit is set to 1, the receive section
+    /// of the UART is enabled. Data reception occurs for either UART
+    /// signals or SIR signals depending on the setting of the SIREN bit.
+    /// When the UART is disabled in the middle of reception, it completes
+    /// the current character before stopping.
+    pub enable_receive: bool,
+    /// `DTR` Data transmit ready. This bit is the complement of the UART
+    /// data transmit ready, `nUARTDTR`, modem status output. That is, when
+    /// the bit is programmed to a 1 then `nUARTDTR` is LOW.
+    pub data_transmit_ready: bool,
+    /// `RTS` Request to send. This bit is the complement of the UART
+    /// request to send, `nUARTRTS`, modem status output. That is, when the
+    /// bit is programmed to a 1 then `nUARTRTS` is LOW.
+    pub request_to_send: bool,
+    /// `Out1` This bit is the complement of the UART Out1 (`nUARTOut1`)
+    /// modem status output. That is, when the bit is programmed to a 1 the
+    /// output is 0. For DTE this can be used as Data Carrier Detect (DCD).
+    pub out_1: bool,
+    /// `Out2` This bit is the complement of the UART Out2 (`nUARTOut2`)
+    /// modem status output. That is, when the bit is programmed to a 1, the
+    /// output is 0. For DTE this can be used as Ring Indicator (RI).
+    pub out_2: bool,
+    /// `RTSEn` RTS hardware flow control enable. If this bit is set to 1,
+    /// RTS hardware flow control is enabled. Data is only requested when
+    /// there is space in the receive FIFO for it to be received.
+    pub rts_hardware_flow_control_enable: bool,
+    /// `CTSEn` CTS hardware flow control enable. If this bit is set to 1,
+    /// CTS hardware flow control is enabled. Data is only transmitted when
+    /// the `nUARTCTS` signal is asserted.
+    pub cts_hardware_flow_control_enable: bool,
+    /// 31:16 - Reserved, do not modify, read as zero.
+    _reserved_zero_no_modify2: u16,
+}
+impl_vmstate_bitsized!(Control);
+
+impl Control {
+    pub fn reset(&mut self) {
+        *self = 0.into();
+        self.set_enable_receive(true);
+        self.set_enable_transmit(true);
+    }
+}
+
+impl Default for Control {
+    fn default() -> Self {
+        let mut ret: Self = 0.into();
+        ret.reset();
+        ret
+    }
+}
+
+/// Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC
+pub struct Interrupt(pub u32);
+
+impl Interrupt {
+    pub const OE: Self = Self(1 << 10);
+    pub const BE: Self = Self(1 << 9);
+    pub const PE: Self = Self(1 << 8);
+    pub const FE: Self = Self(1 << 7);
+    pub const RT: Self = Self(1 << 6);
+    pub const TX: Self = Self(1 << 5);
+    pub const RX: Self = Self(1 << 4);
+    pub const DSR: Self = Self(1 << 3);
+    pub const DCD: Self = Self(1 << 2);
+    pub const CTS: Self = Self(1 << 1);
+    pub const RI: Self = Self(1 << 0);
+
+    pub const E: Self = Self(Self::OE.0 | Self::BE.0 | Self::PE.0 | Self::FE.0);
+    pub const MS: Self = Self(Self::RI.0 | Self::DSR.0 | Self::DCD.0 | Self::CTS.0);
+}
-- 
2.48.1


