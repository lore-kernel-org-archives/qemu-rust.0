Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tD30e-0000Pd-65
	for mharc-qemu-rust@gnu.org; Mon, 18 Nov 2024 09:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tD30T-0000OX-PP
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 09:45:40 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tD30O-0006lz-4B
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 09:45:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43193678216so39387755e9.0
 for <qemu-rust@nongnu.org>; Mon, 18 Nov 2024 06:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731941129; x=1732545929; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zzNa8BCet9g0X/2JC9+/b/B7NG4WB9hplgL/Waii00w=;
 b=qAUc6nPW6bm/CGmtm+879O35JKH/ozwwqGo/UH/F9J2VJ90SY+6MnjrLzaziiZb4+3
 qgUAi9rs2t5Lcy7AioizHWSG1EZJneUcRuwHfInBNC6X4Y/wWhK5kIMBuxMlDVeVvVno
 pOXGtWE/OWcPytZDHyF/QM8TS1Q9l0Yykh+NlfR8X1slFRAaJc/Gnc4l69M4szkbTBz+
 BjOTqSNfp1/hOI0rX65uvNHSoomQmJ/pWiHO/ME+leZRqnZ+Gg2Ly3DDy1mZ98g1khIE
 OuGrwAfam8sY7VBreOjRUxXimZXi64sM9Bu4zpgORIpQMVPQPIGhxW7rLpdDL/CASvK8
 U9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731941129; x=1732545929;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzNa8BCet9g0X/2JC9+/b/B7NG4WB9hplgL/Waii00w=;
 b=ARVHBtPY8SOxQvnEfFk1M05PCWqDPQUynzlBooKEny8ipqmPraD8Cys5vPrfbjAuxW
 poPg6BOEVJC0a9+cAzz39nCZoucK32gyxcvCOtyLWNhGm0N+u2N7iK78W8UhszzvnBTj
 0yFcmqg9wtVik2IMClOclupULYuUqsWR2BVY5QkiN4l3dnxh6RhATnk7bz1hq60zYulH
 K40nAPGTAr+e07E/mZYG/mw5660v2uBl/6QX/JcJzb4vuVI8/igpBjfSISpPE7d1pJBU
 g4lJpJri+TJuRAeognR/eve+brbE5rIiexuik3+OEX4y+vZSWcfO/vnyKtnsrUlK6QXW
 foww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAS8T54rwDp7JsHUP5h4NdCU4BONHd9eDBEMnmZYjMye7opAsstRngWkU6CeW9sEvqY7DGGgd5nT0=@nongnu.org
X-Gm-Message-State: AOJu0Yz2giLgHUvDey/dWY7zs5cOkQ6GzlvP6NT0EvbXXXK7ZJgNOX0J
 XEyVp4Wjq7aEWlfHo+e4u4Be+ycinWiitft8arTj0Wu9uDSRy0aigMbL6xTF51E=
X-Google-Smtp-Source: AGHT+IGnzwQGIip59tD7WbJ1YQt4Xk4B6C7Hc/MeQBM6wNjkLbj9xshgfQpd1rT1o32h3b932pZrQw==
X-Received: by 2002:a05:600c:4505:b0:431:1868:417f with SMTP id
 5b1f17b1804b1-432df74be9amr123890195e9.17.1731941129482; 
 Mon, 18 Nov 2024 06:45:29 -0800 (PST)
Received: from meli-email.org (adsl-123.37.6.2.tellas.gr. [37.6.2.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382444fa548sm4400011f8f.86.2024.11.18.06.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 06:45:29 -0800 (PST)
Date: Mon, 18 Nov 2024 16:39:59 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Bcc: 
Subject: Re: [PATCH v3] rust/pl011: Fix DeviceID reads
User-Agent: meli 0.8.7
References: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org>
 <875xoku5vd.fsf@draig.linaro.org>
In-Reply-To: <875xoku5vd.fsf@draig.linaro.org>
Message-ID: <n5ibr.51opa2z9dha@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.636,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 18 Nov 2024 14:45:41 -0000

On Mon, 18 Nov 2024 13:40, Alex Bennée <alex.bennee@linaro.org> wrote:
>Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
>
>> DeviceId, which maps the peripheral and PCell registers of a PL011
>> device, was not treating each register value as a 32 bit value.
>>
>> Change DeviceId enum to return register values via constified getter
>> functions instead of leveraging the std::ops::Index<_> trait.
>>
>> While at it, print errors when guest attempts to write to other RO
>> registers as well.
>>
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
>>
>> Notes:
>>     Changes from v2:
>>     
>>     - Group invalid write case matches (Paolo)
>>     - Reduce register getter line count to aid review (Peter Maydell)
>>     
><snip>
>> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
>> index 2a85960b81..f1d959ca28 100644
>> --- a/rust/hw/char/pl011/src/device.rs
>> +++ b/rust/hw/char/pl011/src/device.rs
>> @@ -5,7 +5,7 @@
>>  use core::ptr::{addr_of, addr_of_mut, NonNull};
>>  use std::{
>>      ffi::CStr,
>> -    os::raw::{c_int, c_uchar, c_uint, c_void},
>> +    os::raw::{c_int, c_uint, c_void},
>>  };
>>  
>>  use qemu_api::{
>> @@ -32,6 +32,7 @@
>>  /// QEMU sourced constant.
>>  pub const PL011_FIFO_DEPTH: usize = 16_usize;
>>  
>> +/// State enum that represents the values of the peripheral and PCell registers of a PL011 device.
>>  #[derive(Clone, Copy, Debug)]
>>  enum DeviceId {
>>      #[allow(dead_code)]
>> @@ -39,20 +40,51 @@ enum DeviceId {
>>      Luminary,
>>  }
>>  
>> -impl std::ops::Index<hwaddr> for DeviceId {
>> -    type Output = c_uchar;
>> +macro_rules! pcell_reg_getter {
>> +    ($($(#[$attrs:meta])* fn $getter_fn:ident -> $value:literal),*$(,)?) => {
>> +        $($(#[$attrs])* const fn $getter_fn(self) -> u64 { $value })*
>> +    };
>> +}
>>  
>> -    fn index(&self, idx: hwaddr) -> &Self::Output {
>> -        match self {
>> -            Self::Arm => &Self::PL011_ID_ARM[idx as usize],
>> -            Self::Luminary => &Self::PL011_ID_LUMINARY[idx as usize],
>> -        }
>> -    }
>> +macro_rules! periph_reg_getter {
>> +    ($($(#[$attrs:meta])* fn $getter_fn:ident -> { Arm => $arm:literal, Luminary => $lum:literal$(,)?}),*$(,)?) => {
>> +        $(
>> +            $(#[$attrs])*
>> +            const fn $getter_fn(self) -> u64 {
>> +                (match self {
>> +                    Self::Arm => $arm,
>> +                    Self::Luminary => $lum,
>> +                }) as u64
>> +            }
>> +        )*
>> +    };
>>  }
>>  
>>  impl DeviceId {
>> -    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
>> -    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
>> +    /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
>> +    const fn uart_periph_id0(self) -> u64 {
>> +        0x11
>> +    }
>> +
>> +    periph_reg_getter! {
>> +        /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
>> +        fn uart_periph_id1 -> { Arm => 0x10, Luminary => 0x00 },
>> +        /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
>> +        fn uart_periph_id2 -> { Arm => 0x14, Luminary => 0x18 },
>> +        /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
>> +        fn uart_periph_id3 -> { Arm => 0x0, Luminary => 0x1 }
>> +    }
>> +
>> +    pcell_reg_getter! {
>> +        /// Value of `UARTPCellID0` register.
>> +        fn uart_pcell_id0 -> 0x0d,
>> +        /// Value of `UARTPCellID1` register.
>> +        fn uart_pcell_id1 -> 0xf0,
>> +        /// Value of `UARTPCellID2` register.
>> +        fn uart_pcell_id2 -> 0x05,
>> +        /// Value of `UARTPCellID3` register.
>> +        fn uart_pcell_id3 -> 0xb1,
>> +    }
>
>I share the concern that this is quite a verbose way of handling a
>fairly simple set of read-only constants. Is the end result really
>folded away to a simple const lookup?

Yep, const fns are evaluated at compile time. Alternatively we just 
could remove the DeviceID struct and inline everything in the read() 
method.

>
>Perhaps this comes down to unfamiliarity with the way macros are working
>here but in general macros should be eliding boilerplate to allow us to
>concisely represent the relevant data and functionality. Here it adds an
>additional indirection when reading the code just to see what is going
>on.

Well in the previous patch versions the concern was that it was 
"verbose". But even if the registers are available as memory mapped in 
the device it's the wrong abstraction to use here; this is a higher 
level language than C and using indices is a "when you have a hammer 
everything looks like a nail" situation.

We have different programming paradigms in Rust, allowing as to have 
documented code (via rustdoc), so either we take advantage of Rust or we 
don't.

>
>>  }
>>  
>>  #[repr(C)]
>> @@ -182,9 +214,14 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
>>          use RegisterOffset::*;
>>  
>>          std::ops::ControlFlow::Break(match RegisterOffset::try_from(offset) {
>> -            Err(v) if (0x3f8..0x400).contains(&v) => {
>> -                u64::from(self.device_id[(offset - 0xfe0) >> 2])
>> -            }
>> +            Ok(PeriphID0) => self.device_id.uart_periph_id0(),
>> +            Ok(PeriphID1) => self.device_id.uart_periph_id1(),
>> +            Ok(PeriphID2) => self.device_id.uart_periph_id2(),
>> +            Ok(PeriphID3) => self.device_id.uart_periph_id3(),
>> +            Ok(PCellID0) => self.device_id.uart_pcell_id0(),
>> +            Ok(PCellID1) => self.device_id.uart_pcell_id1(),
>> +            Ok(PCellID2) => self.device_id.uart_pcell_id2(),
>> +            Ok(PCellID3) => self.device_id.uart_pcell_id3(),
>>              Err(_) => {
>>                  // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
>>                  0
>> @@ -236,9 +273,15 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
>>          use RegisterOffset::*;
>>          let value: u32 = value as u32;
>>          match RegisterOffset::try_from(offset) {
>> -            Err(_bad_offset) => {
>> +            Err(_) => {
>>                  eprintln!("write bad offset {offset} value {value}");
>>              }
>> +            Ok(
>> +                dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3 | PCellID0 | PCellID1
>> +                | PCellID2 | PCellID3 | FR | RIS | MIS),
>> +            ) => {
>
>This is a nice improvement in conciseness over the separate legs removed bellow.
>
>> +                eprintln!("write bad offset {offset} at RO register {dev_id:?} value {value}");
>> +            }
>
>Is a binding for qemu_log and friends on the todo list?

I had sent patches on a previous patch series that only some patches of 
them were picked up for merging, I plan to send a new revision soon

>
>>              Ok(DR) => {
>>                  // ??? Check if transmitter is enabled.
>>                  let ch: u8 = value as u8;
>> @@ -257,9 +300,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
>>              Ok(RSR) => {
>>                  self.receive_status_error_clear = 0.into();
>>              }
>> -            Ok(FR) => {
>> -                // flag writes are ignored
>> -            }
>>              Ok(ILPR) => {
>>                  self.ilpr = value;
>>              }
>> @@ -308,8 +348,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
>>                  self.int_enabled = value;
>>                  self.update();
>>              }
>> -            Ok(RIS) => {}
>> -            Ok(MIS) => {}
>>              Ok(ICR) => {
>>                  self.int_level &= !value;
>>                  self.update();
>> diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
>> index cd0a49acb9..1f305aa13f 100644
>> --- a/rust/hw/char/pl011/src/lib.rs
>> +++ b/rust/hw/char/pl011/src/lib.rs
>> @@ -111,6 +111,22 @@ pub enum RegisterOffset {
>>      /// DMA control Register
>>      #[doc(alias = "UARTDMACR")]
>>      DMACR = 0x048,
>> +    #[doc(alias = "UARTPeriphID0")]
>> +    PeriphID0 = 0xFE0,
>> +    #[doc(alias = "UARTPeriphID1")]
>> +    PeriphID1 = 0xFE4,
>> +    #[doc(alias = "UARTPeriphID2")]
>> +    PeriphID2 = 0xFE8,
>> +    #[doc(alias = "UARTPeriphID3")]
>> +    PeriphID3 = 0xFEC,
>> +    #[doc(alias = "UARTPCellID0")]
>> +    PCellID0 = 0xFF0,
>> +    #[doc(alias = "UARTPCellID1")]
>> +    PCellID1 = 0xFF4,
>> +    #[doc(alias = "UARTPCellID2")]
>> +    PCellID2 = 0xFF8,
>> +    #[doc(alias = "UARTPCellID3")]
>> +    PCellID3 = 0xFFC,
>
>Why do we have specific doc aliases rather than just naming the
>registers with the full name?

Because prefix enum variants with the same prefix is an anti-pattern in 
idiomatic Rust.

>
>>      ///// Reserved, offsets `0x04C` to `0x07C`.
>>      //Reserved = 0x04C,
>>  }
>> @@ -137,7 +153,11 @@ const fn _assert_exhaustive(val: RegisterOffset) {
>>                  }
>>              }
>>          }
>> -        case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR }
>> +        case! {
>> +            DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR,
>> +            PeriphID0, PeriphID1, PeriphID2, PeriphID3,
>> +            PCellID0, PCellID1, PCellID2, PCellID3,
>> +        }
>>      }
>>  }
>>  
>>
>> base-commit: 43f2def68476697deb0d119cbae51b20019c6c86
>
>-- 
>Alex Bennée
>Virtualisation Tech Lead @ Linaro

