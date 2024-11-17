Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tCcIp-0008O3-3n
	for mharc-qemu-rust@gnu.org; Sun, 17 Nov 2024 05:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCcIm-0008NZ-Jh
 for qemu-rust@nongnu.org; Sun, 17 Nov 2024 05:14:44 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCcIk-0002cE-5Z
 for qemu-rust@nongnu.org; Sun, 17 Nov 2024 05:14:43 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cfbc911b6cso528296a12.1
 for <qemu-rust@nongnu.org>; Sun, 17 Nov 2024 02:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731838480; x=1732443280; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mHeEnxj6FSVQ9gUgCmwZgAJaHnlsmHPOgpH2cS45R5c=;
 b=quyvPS8Iz9WpQf9sCnpsEhuO2UCEqZ+odnfOTMbVnZ5GRj0QzHf6XNv7wNYrzpsmi9
 NNtlQkK0B+1TsDVuq6zQcAR/Nz7ObwM2pAqGnqlCMS44fiyu09/iPcRHLJkDAo3k1C4e
 yl9Q3EvHOKImjIy+lyKwEytGr2u8WDuSHwQtR0qWJ1EJ2COP/sDjAdD8vdYH5IkTyzxQ
 IJiJC0AMJkr1rVDJmSO/md8Xs8STJVpB8B+olRhNZC0KWGxkJh6ojMdn6Qpf0lNodclh
 FVcER1tufPpiDnH4aamIUCXiGS2saBe6kt9hStngXuGO/jLWTkKDfMTiiWbRG7EjJaRL
 kyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731838480; x=1732443280;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mHeEnxj6FSVQ9gUgCmwZgAJaHnlsmHPOgpH2cS45R5c=;
 b=wUbzBWzmExEZQG/Yet6SghsIG7JtqVcGXPZGmmP6dHQvUoFbMS0XyF1TpnMfOY4L4h
 8FYytTs0jSNAebLHdXNQt5sYDHw/WQTKgzYtVLKDEAmbpUKTWDUTR7FOi3tkqTLn1qxn
 v+S3Xtg01ZXXyWUCGo7EjJTW9BSOhc6HGpWlPB6Y/7Tl1EGBcdtqSd338cmim0Cqc/Yv
 T775djcyn3CaPz/0YatFUT4cBnD+AHsm9bJgSCjaTjpX2aPNdH3aBvDpmaFb+S7Ygk6L
 hMAPhNKHHjd9Aja/yTKXb4AvAyAguVFhYLrNthTKVc/53O94NHLtZZIKjSO6cnovuNJU
 MdwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSTzx4ipttPDTeEwj6vZ8e5XId4SX4G/RQk8nr+0QslclkuPhnwd4UTd2U22I5Zj6CFsJ6Mdqoq9Y=@nongnu.org
X-Gm-Message-State: AOJu0YxSEq4B/3sSjVhJ3H2CDx0igRMxx1Y9o7xyxx1b6L/Ha5Trtth+
 EcnuduUmvhmfzPTEVHO0EuKx2+Fs+HhOjz+LE0Rl+5as3ny6VMFRrQ4nf+NxVkbNHCsibIh/z40
 z/sSENlNZvD3fGO9fRpAGvY7ZG+0/jYIB3puHSw==
X-Google-Smtp-Source: AGHT+IF4++eWbTfA40zWMpS3vmibIp4IDq+JiEvZyxqVV7nQY+5tBZ+0tdFgcye7beqVKwh/xEIzBEetZgq4lTEq++w=
X-Received: by 2002:a17:907:1b2a:b0:a9d:e1d6:41fc with SMTP id
 a640c23a62f3a-aa48354d137mr846122666b.53.1731838479814; Sun, 17 Nov 2024
 02:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
In-Reply-To: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 17 Nov 2024 10:14:29 +0000
Message-ID: <CAFEAcA9m7EnMX+=T0TL2R_NCJqaPUPCUcoYzAo4P2oRUZbM6Kg@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 17 Nov 2024 10:14:44 -0000

On Sat, 16 Nov 2024 at 22:18, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> DeviceId, which maps the peripheral and PCell registers of a PL011
> device, was not treating each register value as a 32 bit value.
>
> Change DeviceId enum to return register values via constified getter
> functions instead of leveraging the std::ops::Index<_> trait.
>
> While at it, print errors when guest attempts to write to other RO
> registers as well.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>



>  rust/hw/char/pl011/src/device.rs | 93 ++++++++++++++++++++++++--------
>  rust/hw/char/pl011/src/lib.rs    | 22 +++++++-
>  2 files changed, 93 insertions(+), 22 deletions(-)
>
> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
> index 2a85960b81..fc6f3f394d 100644
> --- a/rust/hw/char/pl011/src/device.rs
> +++ b/rust/hw/char/pl011/src/device.rs
> @@ -5,7 +5,7 @@
>  use core::ptr::{addr_of, addr_of_mut, NonNull};
>  use std::{
>      ffi::CStr,
> -    os::raw::{c_int, c_uchar, c_uint, c_void},
> +    os::raw::{c_int, c_uint, c_void},
>  };
>
>  use qemu_api::{
> @@ -32,6 +32,7 @@
>  /// QEMU sourced constant.
>  pub const PL011_FIFO_DEPTH: usize = 16_usize;
>
> +/// State enum that represents the values of the peripheral and PCell registers of a PL011 device.
>  #[derive(Clone, Copy, Debug)]
>  enum DeviceId {
>      #[allow(dead_code)]
> @@ -39,20 +40,55 @@ enum DeviceId {
>      Luminary,
>  }
>
> -impl std::ops::Index<hwaddr> for DeviceId {
> -    type Output = c_uchar;
> -
> -    fn index(&self, idx: hwaddr) -> &Self::Output {
> -        match self {
> -            Self::Arm => &Self::PL011_ID_ARM[idx as usize],
> -            Self::Luminary => &Self::PL011_ID_LUMINARY[idx as usize],
> -        }
> -    }
> -}
> -
>  impl DeviceId {
> -    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
> -    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
> +    /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
> +    const fn uart_periph_id0(self) -> u64 {
> +        0x11
> +    }
> +
> +    /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
> +    const fn uart_periph_id1(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x10,
> +            Self::Luminary => 0x00,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
> +    const fn uart_periph_id2(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x14,
> +            Self::Luminary => 0x18,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
> +    const fn uart_periph_id3(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x0,
> +            Self::Luminary => 0x1,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPCellID0` register.
> +    const fn uart_pcell_id0(self) -> u64 {
> +        0x0d
> +    }
> +
> +    /// Value of `UARTPCellID1` register.
> +    const fn uart_pcell_id1(self) -> u64 {
> +        0xf0
> +    }
> +
> +    /// Value of `UARTPCellID2` register.
> +    const fn uart_pcell_id2(self) -> u64 {
> +        0x05
> +    }
> +
> +    /// Value of `UARTPCellID3` register.
> +    const fn uart_pcell_id3(self) -> u64 {
> +        0xb1
> +    }

This seems extremely verbose and rather obscures the fact that these
registers are a set of adjacent simple ID registers, compared to
the previous code which defined them as an array of values.

Isn't there some way to write this that doesn't need so much code to do it?
All the PLxxx devices and various others have this set of standard
ID registers, because it's part of a standardized scheme, so we're
going to end up with similar code in multiple device models. I would
hope that Rust offers us ways to avoid having boilerplate code
where you need to write dozens of lines to express this.

thanks
-- PMM

